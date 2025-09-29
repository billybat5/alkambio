
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../exchange_rates/domain/entities/conversion_rate.dart';
import '../../../history/data/models/calculation_history_model.dart';
import '../../../history/domain/repositories/history_repository.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

@injectable
class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final HistoryRepository historyRepository;

  CalculatorBloc({required this.historyRepository}) : super(CalculatorInitial()) {
    on<AmountChanged>((event, emit) async {
      final amount = double.tryParse(event.amount) ?? 0.0;
      final newValues = <String, double>{};

      for (var rate in event.rates) {
        if (rate.baseValue > 0) {
          newValues[rate.rateCurrency.code] = amount / rate.baseValue;
        }
      }

      emit(CalculatorResult(newValues));

      // Save calculation to history
      if (amount > 0 && event.rates.isNotEmpty) {
        final calculation = CalculationHistory(
          inputAmount: amount,
          baseCurrencyCode: event.rates.first.rateCurrency.code, // Assuming base currency is the first rate's currency
          convertedValues: newValues,
          timestamp: DateTime.now(),
        );
        await historyRepository.saveCalculation(calculation);
      }
    });
  }
}
