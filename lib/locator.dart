import 'package:get_it/get_it.dart';
import 'package:kantin_online/services/navigation_service.dart';
import 'package:kantin_online/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => StorageService());
}