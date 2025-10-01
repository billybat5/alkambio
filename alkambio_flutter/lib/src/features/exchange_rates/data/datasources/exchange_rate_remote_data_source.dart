
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../core/log_service.dart';
import '../../../../injection_container.dart';

import '../models/country_conversion_model.dart';

abstract class ExchangeRateRemoteDataSource {
  Future<CountryConversionModel> getCountryConversions(String countryCode);
}

@LazySingleton(as: ExchangeRateRemoteDataSource)
class ExchangeRateRemoteDataSourceImpl implements ExchangeRateRemoteDataSource {
  final http.Client client;
  final LogService logService = sl<LogService>();

  ExchangeRateRemoteDataSourceImpl({required this.client});

  @override
  Future<CountryConversionModel> getCountryConversions(String countryCode) async {
    const url = 'https://api.alcambio.app/graphql';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Apollographql-Client-Name': 'web',
      'Apollographql-Client-Version': '1.0.0',
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',
    };
    final body = {
      'operationName': 'getCountryConversions',
      'query':
          '''query getCountryConversions(\$countryCode: String!) {
              getCountryConversions(payload: {countryCode: \$countryCode}) {
                _id
                baseCurrency {
                  code
                  name
                  symbol
                }
                country {
                  code
                  name
                  flag
                }
                conversionRates {
                  baseValue
                  official
                  principal
                  usesRateValue
                  rateCurrency {
                    code
                    name
                    symbol
                  }
                  rateValue
                  type
                }
                dateBcv
              }
            }
          ''',
      'variables': {'countryCode': countryCode},
    };

    final response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      logService.log('API Response: ${response.body}');
      try {
        final jsonResponse = json.decode(response.body);
        final data = jsonResponse['data']['getCountryConversions'];
        return CountryConversionModel.fromJson(data);
      } catch (e) {
        logService.log('Error parsing JSON: $e');
        throw Exception('Failed to parse conversion rates');
      }
    } else {
      logService.log('API Error: ${response.statusCode}');
      throw Exception('Failed to load conversion rates');
    }
  }
}
