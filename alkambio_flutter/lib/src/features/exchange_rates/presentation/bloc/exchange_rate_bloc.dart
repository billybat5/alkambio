import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/country_conversion.dart';
import '../../domain/usecases/get_country_conversions.dart';

part 'exchange_rate_event.dart';
part 'exchange_rate_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

@injectable
class ExchangeRateBloc extends Bloc<ExchangeRateEvent, ExchangeRateState> {
  final GetCountryConversions getCountryConversions;

  ExchangeRateBloc({required this.getCountryConversions})
      : super(ExchangeRateInitial()) {
    on<GetRatesForCountry>((event, emit) async {
      emit(ExchangeRateLoading());
      final failureOrConversion =
          await getCountryConversions(Params(countryCode: event.countryCode));
      failureOrConversion.fold(
        (failure) => emit(const ExchangeRateError(message: SERVER_FAILURE_MESSAGE)),
        (conversion) => emit(ExchangeRateLoaded(conversion: conversion)),
      );
    });
  }
}
