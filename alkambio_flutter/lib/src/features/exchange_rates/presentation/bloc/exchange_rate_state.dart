
part of 'exchange_rate_bloc.dart';

abstract class ExchangeRateState extends Equatable {
  const ExchangeRateState();

  @override
  List<Object> get props => [];
}

class ExchangeRateInitial extends ExchangeRateState {}

class ExchangeRateLoading extends ExchangeRateState {}

class ExchangeRateLoaded extends ExchangeRateState {
  final CountryConversion conversion;

  const ExchangeRateLoaded({required this.conversion});

  @override
  List<Object> get props => [conversion];
}

class ExchangeRateError extends ExchangeRateState {
  final String message;

  const ExchangeRateError({required this.message});

  @override
  List<Object> get props => [message];
}
