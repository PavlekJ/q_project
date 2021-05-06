
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

@injectableInit
void configureDependencies(String environment) => $initGetIt(GetIt.instance, environment: environment); 

abstract class AppEnvironment {
  static const dev = 'dev';
  static const staging = 'staging';
  static const prod = 'prod';
}
