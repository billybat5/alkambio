
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../exchange_rates/domain/entities/conversion_rate.dart';

class CalculationHistory extends Equatable {
  final double inputAmount;
  final String baseCurrencyCode;
  final Map<String, double> convertedValues;
  final DateTime timestamp;

  const CalculationHistory({
    required this.inputAmount,
    required this.baseCurrencyCode,
    required this.convertedValues,
    required this.timestamp,
  });

  factory CalculationHistory.fromJson(Map<String, dynamic> json) {
    return CalculationHistory(
      inputAmount: json['inputAmount'] as double,
      baseCurrencyCode: json['baseCurrencyCode'] as String,
      convertedValues: Map<String, double>.from(json['convertedValues'] as Map),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inputAmount': inputAmount,
      'baseCurrencyCode': baseCurrencyCode,
      'convertedValues': convertedValues,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        inputAmount,
        baseCurrencyCode,
        convertedValues,
        timestamp,
      ];
}
