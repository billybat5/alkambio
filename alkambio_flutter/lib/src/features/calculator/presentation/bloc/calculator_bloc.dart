
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/log_service.dart';

import '../../../exchange_rates/domain/entities/conversion_rate.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final LogService logService;

  CalculatorBloc({required this.logService}) : super(CalculatorInitial()) {
    on<AmountChanged>((event, emit) async {
      logService.log('AmountChanged event received: ${event.amount}');
      final amount = double.tryParse(event.amount) ?? 0.0;
      final newValues = <String, double>{};

      for (var rate in event.rates) {
        if (rate.baseValue > 0) {
          newValues[rate.rateCurrency.code] = amount / rate.baseValue;
        }
      }

      logService.log('New values calculated: $newValues');
      emit(CalculatorResult(newValues));
    });
  }
}
