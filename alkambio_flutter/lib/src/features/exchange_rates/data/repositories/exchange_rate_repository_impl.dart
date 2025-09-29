
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/conversion_rate.dart';
import '../../domain/entities/country_conversion.dart';
import '../../domain/entities/currency.dart';
import '../../domain/repositories/exchange_rate_repository.dart';
import '../datasources/exchange_rate_remote_data_source.dart';
import '../models/country_conversion_model.dart';

@LazySingleton(as: ExchangeRateRepository)
class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExchangeRateRemoteDataSource remoteDataSource;

  ExchangeRateRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CountryConversion>> getCountryConversions(
      String countryCode) async {
    try {
      final remoteConversion =
          await remoteDataSource.getCountryConversions(countryCode);
      return Right(_mapModelToEntity(remoteConversion));
    } on Exception {
      return Left(ServerFailure());
    }
  }

  CountryConversion _mapModelToEntity(CountryConversionModel model) {
    return CountryConversion(
      baseCurrency: Currency(
        code: model.baseCurrency.code,
        name: model.baseCurrency.name,
        symbol: model.baseCurrency.symbol,
      ),
      conversionRates: model.conversionRates
          .map((rate) => ConversionRate(
                baseValue: rate.baseValue,
                rateCurrency: Currency(
                  code: rate.rateCurrency.code,
                  name: rate.rateCurrency.name,
                  symbol: rate.rateCurrency.symbol,
                ),
                rateValue: rate.rateValue,
                type: rate.type,
              ))
          .toList(),
      dateBcv: DateTime.fromMillisecondsSinceEpoch(model.dateBcv),
    );
  }
}
