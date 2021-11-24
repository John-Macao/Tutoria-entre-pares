import 'package:frontend/Controlador/Tutor/tutor_generar_tutoria_controller.dart';
import 'package:frontend/Controlador/Tutor/tutor_inicio_controller.dart';
import 'package:frontend/Vista/Tutor/tutor_generar_tutoria.dart';
import 'package:frontend/Vista/Tutor/tutor_inicio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetItTutor(){
  getIt.registerLazySingleton<TutorInicio>(() => TutorInicio());
  getIt.registerLazySingleton<TutorInicioController>(() => TutorInicioController());
  
  getIt.registerLazySingleton<TutorGenerarTutoria>(() => TutorGenerarTutoria());
  getIt.registerLazySingleton<TutorGenerarTutoriaController>(() => TutorGenerarTutoriaController());
}