
part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class AmountChanged extends CalculatorEvent {
  final String amount;
  final List<ConversionRate> rates;

  const AmountChanged({required this.amount, required this.rates});

  @override
  List<Object> get props => [amount, rates];
}
