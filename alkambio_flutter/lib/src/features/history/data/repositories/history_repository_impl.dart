
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/history_repository.dart';
import '../models/calculation_history_model.dart';

const String CACHED_CALCULATION_HISTORY = 'CACHED_CALCULATION_HISTORY';

@LazySingleton(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final SharedPreferences sharedPreferences;

  HistoryRepositoryImpl({required this.sharedPreferences});

  @override
  Future<Either<Failure, List<CalculationHistory>>> getCalculationHistory() async {
    final jsonString = sharedPreferences.getString(CACHED_CALCULATION_HISTORY);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      final history = jsonList
          .map((json) => CalculationHistory.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(history);
    } else {
      return const Right([]); // Return empty list if no history
    }
  }

  @override
  Future<Either<Failure, void>> saveCalculation(CalculationHistory calculation) async {
    try {
      final currentHistory = await getCalculationHistory().then((value) => value.fold((l) => [], (r) => r));
      final updatedHistory = [...currentHistory, calculation];
      final jsonString = json.encode(updatedHistory.map((e) => e.toJson()).toList());
      await sharedPreferences.setString(CACHED_CALCULATION_HISTORY, jsonString);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
