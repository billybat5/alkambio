import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/country_conversion.dart';
import '../repositories/exchange_rate_repository.dart';

@lazySingleton
class GetCountryConversions implements UseCase<CountryConversion, Params> {
  final ExchangeRateRepository repository;

  GetCountryConversions(this.repository);

  @override
  Future<Either<Failure, CountryConversion>> call(Params params) async {
    return await repository.getCountryConversions(params.countryCode);
  }
}

class Params extends Equatable {
  final String countryCode;

  const Params({required this.countryCode});

  @override
  List<Object?> get props => [countryCode];
}
