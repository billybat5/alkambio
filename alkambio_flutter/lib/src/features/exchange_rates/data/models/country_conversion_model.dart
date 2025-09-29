
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'conversion_rate_model.dart';
import 'country_model.dart';
import 'currency_model.dart';

part 'country_conversion_model.g.dart';

@JsonSerializable()
class CountryConversionModel extends Equatable {
  const CountryConversionModel({
    required this.baseCurrency,
    required this.country,
    required this.conversionRates,
    required this.dateBcv,
  });

  factory CountryConversionModel.fromJson(Map<String, dynamic> json) =>
      _$CountryConversionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryConversionModelToJson(this);

  final CurrencyModel baseCurrency;
  final CountryModel country;
  final List<ConversionRateModel> conversionRates;
  final int dateBcv;

  @override
  List<Object?> get props => [baseCurrency, country, conversionRates, dateBcv];
}
