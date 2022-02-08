import 'package:frontend/data/local_db/asistencia_api.dart';
import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/menu_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/repository/asistencia_repository.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/menu_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup(){
  //MENU
  locator.registerLazySingleton<MenuRepository>(
    () => MenuRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<Menu_api>(
    () => Menu_api()
  );

  //ASISTENCIA
  locator.registerLazySingleton<AsistenciaRepository>(
    () => AsistenciaRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<Asistencia_api>(
    () => Asistencia_api()
  );

  //COORDINACION
  locator.registerLazySingleton<CoordinacionRepository>(
    () => CoordinacionRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<Coordinacion_api>(
    () => Coordinacion_api()
  );

  //HORARIO
  locator.registerLazySingleton<HorarioRepository>(
    () => HorarioRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<Horario_api>(
    () => Horario_api()
  );

  //MATERIA OFERTA
  locator.registerLazySingleton<MateriaOfertaRepository>(
    () => MateriaOfertaRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<MateriaOferta_api>(
    () => MateriaOferta_api()
  );

  //USUARIO
  locator.registerLazySingleton<UsuarioRepository>(
    () => UsuarioRepository(
      locator.get(),
    )
  );

  locator.registerLazySingleton<Usuario_api>(
    () => Usuario_api()
  );

}