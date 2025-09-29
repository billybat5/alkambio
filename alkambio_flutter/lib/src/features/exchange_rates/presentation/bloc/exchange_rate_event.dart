
part of 'exchange_rate_bloc.dart';

abstract class ExchangeRateEvent extends Equatable {
  const ExchangeRateEvent();

  @override
  List<Object> get props => [];
}

class GetRatesForCountry extends ExchangeRateEvent {
  final String countryCode;

  const GetRatesForCountry(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}
