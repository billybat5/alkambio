
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/country_conversion.dart';

abstract class ExchangeRateRepository {
  Future<Either<Failure, CountryConversion>> getCountryConversions(
      String countryCode);
}
