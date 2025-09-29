
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'currency_model.dart';

part 'conversion_rate_model.g.dart';

@JsonSerializable()
class ConversionRateModel extends Equatable {
  const ConversionRateModel({
    required this.baseValue,
    required this.official,
    required this.principal,
    required this.usesRateValue,
    required this.rateCurrency,
    required this.rateValue,
    required this.type,
  });

  factory ConversionRateModel.fromJson(Map<String, dynamic> json) =>
      _$ConversionRateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionRateModelToJson(this);

  final double baseValue;
  final bool official;
  final bool principal;
  final bool usesRateValue;
  final CurrencyModel rateCurrency;
  final double rateValue;
  final String type;

  @override
  List<Object?> get props => [
        baseValue,
        official,
        principal,
        usesRateValue,
        rateCurrency,
        rateValue,
        type,
      ];
}
