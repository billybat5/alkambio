
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../exchange_rates/domain/entities/conversion_rate.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<AmountChanged>((event, emit) async {
      final amount = double.tryParse(event.amount) ?? 0.0;
      final newValues = <String, double>{};

      for (var rate in event.rates) {
        if (rate.baseValue > 0) {
          newValues[rate.rateCurrency.code] = amount / rate.baseValue;
        }
      }

      emit(CalculatorResult(newValues));
    });
  }
}
