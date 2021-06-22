import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator(){
  getIt.registerLazySingleton(() => FlutterSecureStorage());
}