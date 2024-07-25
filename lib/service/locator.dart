import 'package:dependency_injection/service/api_service.dart';
import 'package:dependency_injection/service/logger_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => LoggerService());
}
