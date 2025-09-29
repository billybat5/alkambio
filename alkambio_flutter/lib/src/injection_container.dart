
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => $initGetIt(sl);

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get client => http.Client();

  @preResolve // For async dependencies
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
