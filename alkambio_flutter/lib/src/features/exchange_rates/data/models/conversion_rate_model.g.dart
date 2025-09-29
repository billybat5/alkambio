// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionRateModel _$ConversionRateModelFromJson(Map<String, dynamic> json) =>
    ConversionRateModel(
      baseValue: (json['baseValue'] as num).toDouble(),
      official: json['official'] as bool,
      principal: json['principal'] as bool,
      usesRateValue: json['usesRateValue'] as bool,
      rateCurrency: CurrencyModel.fromJson(
        json['rateCurrency'] as Map<String, dynamic>,
      ),
      rateValue: (json['rateValue'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$ConversionRateModelToJson(
  ConversionRateModel instance,
) => <String, dynamic>{
  'baseValue': instance.baseValue,
  'official': instance.official,
  'principal': instance.principal,
  'usesRateValue': instance.usesRateValue,
  'rateCurrency': instance.rateCurrency,
  'rateValue': instance.rateValue,
  'type': instance.type,
};
