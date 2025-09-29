
part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {}

class CalculatorResult extends CalculatorState {
  // Map of currency code to its calculated value
  final Map<String, double> convertedValues;

  const CalculatorResult(this.convertedValues);

  @override
  List<Object> get props => [convertedValues];
}
