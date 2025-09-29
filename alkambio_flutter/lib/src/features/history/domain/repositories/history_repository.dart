
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../data/models/calculation_history_model.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<CalculationHistory>>> getCalculationHistory();
  Future<Either<Failure, void>> saveCalculation(CalculationHistory calculation);
}
