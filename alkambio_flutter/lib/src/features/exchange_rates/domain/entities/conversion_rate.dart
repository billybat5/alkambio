
import 'package:equatable/equatable.dart';

import 'currency.dart';

class ConversionRate extends Equatable {
  const ConversionRate({
    required this.baseValue,
    required this.rateCurrency,
    required this.rateValue,
    required this.type,
  });

  final double baseValue;
  final Currency rateCurrency;
  final double rateValue;
  final String type;

  @override
  List<Object?> get props => [baseValue, rateCurrency, rateValue, type];
}
