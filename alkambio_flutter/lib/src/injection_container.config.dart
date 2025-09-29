// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'features/calculator/presentation/bloc/calculator_bloc.dart' as _i480;
import 'features/exchange_rates/data/datasources/exchange_rate_remote_data_source.dart'
    as _i176;
import 'features/exchange_rates/data/repositories/exchange_rate_repository_impl.dart'
    as _i778;
import 'features/exchange_rates/domain/repositories/exchange_rate_repository.dart'
    as _i879;
import 'features/exchange_rates/domain/usecases/get_country_conversions.dart'
    as _i276;
import 'features/exchange_rates/presentation/bloc/exchange_rate_bloc.dart'
    as _i688;
import 'features/history/data/repositories/history_repository_impl.dart'
    as _i1064;
import 'features/history/domain/repositories/history_repository.dart' as _i190;
import 'injection_container.dart' as _i809;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i480.CalculatorBloc>(() => _i480.CalculatorBloc());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i519.Client>(() => registerModule.client);
  gh.lazySingleton<_i176.ExchangeRateRemoteDataSource>(
    () => _i176.ExchangeRateRemoteDataSourceImpl(client: gh<_i519.Client>()),
  );
  gh.lazySingleton<_i190.HistoryRepository>(
    () => _i1064.HistoryRepositoryImpl(
      sharedPreferences: gh<_i460.SharedPreferences>(),
    ),
  );
  gh.lazySingleton<_i879.ExchangeRateRepository>(
    () => _i778.ExchangeRateRepositoryImpl(
      remoteDataSource: gh<_i176.ExchangeRateRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i276.GetCountryConversions>(
    () => _i276.GetCountryConversions(gh<_i879.ExchangeRateRepository>()),
  );
  gh.factory<_i688.ExchangeRateBloc>(
    () => _i688.ExchangeRateBloc(
      getCountryConversions: gh<_i276.GetCountryConversions>(),
    ),
  );
  return getIt;
}

class _$RegisterModule extends _i809.RegisterModule {}
