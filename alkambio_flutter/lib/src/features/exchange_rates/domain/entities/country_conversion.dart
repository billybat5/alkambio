
import 'package:equatable/equatable.dart';

import 'conversion_rate.dart';
import 'currency.dart';

class CountryConversion extends Equatable {
  const CountryConversion({
    required this.baseCurrency,
    required this.conversionRates,
    required this.dateBcv,
  });

  final Currency baseCurrency;
  final List<ConversionRate> conversionRates;
  final DateTime dateBcv;

  @override
  List<Object?> get props => [baseCurrency, conversionRates, dateBcv];
}
