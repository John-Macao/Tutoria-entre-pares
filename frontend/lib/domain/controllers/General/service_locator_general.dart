import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/views/General/login.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetItGeneral(){
  getIt.registerLazySingleton<Login>(() => Login());

  getIt.registerLazySingleton<MsalService>(() => MsalService());
}