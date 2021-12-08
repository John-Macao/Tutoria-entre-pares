import 'package:frontend/domain/controllers/Tutor/tutor_generar_tutoria_controller.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_inicio_controller.dart';
import 'package:frontend/views/Tutor/tutor_generar_tutoria.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetItTutor(){
  getIt.registerLazySingleton<TutorInicio>(() => TutorInicio());
  getIt.registerLazySingleton<TutorInicioController>(() => TutorInicioController());
  
  getIt.registerLazySingleton<TutorGenerarTutoria>(() => TutorGenerarTutoria());
  getIt.registerLazySingleton<TutorGenerarTutoriaController>(() => TutorGenerarTutoriaController());
}