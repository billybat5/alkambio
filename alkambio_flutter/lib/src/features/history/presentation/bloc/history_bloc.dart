
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../data/models/calculation_history_model.dart';
import '../domain/repositories/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

@injectable
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository historyRepository;

  HistoryBloc({required this.historyRepository}) : super(HistoryInitial()) {
    on<LoadHistory>((event, emit) async {
      emit(HistoryLoading());
      final failureOrHistory = await historyRepository.getCalculationHistory();
      failureOrHistory.fold(
        (failure) => emit(const HistoryError(message: CACHE_FAILURE_MESSAGE)),
        (history) => emit(HistoryLoaded(history: history)),
      );
    });
  }
}
