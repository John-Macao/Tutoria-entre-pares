import 'package:frontend/Controlador/General/login_controller.dart';
import 'package:frontend/Vista/General/login.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetItGeneral(){
  getIt.registerLazySingleton<Login>(() => Login());

  getIt.registerLazySingleton<LoginController>(() => LoginController());
}