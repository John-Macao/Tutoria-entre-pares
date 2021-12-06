import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Vista/General/login.dart';
import 'package:frontend/Vista/Tutor/totur_listar_sesiones.dart';
import 'package:frontend/Vista/Tutor/tutor_coordinacion.dart';
import 'package:frontend/Vista/Tutor/tutor_generar_sesion.dart';
import 'package:frontend/Vista/Tutor/tutor_generar_tutoria.dart';
import 'package:frontend/Vista/Tutor/tutor_inicio.dart';
import 'package:frontend/Vista/Tutor/tutor_modificar_telefono.dart';
import 'package:frontend/Vista/Tutor/tutor_modificar_tutoria.dart';
import 'package:frontend/Vista/Tutorado/tutorado_historico.dart';
import 'package:frontend/Vista/Tutorado/tutorado_horario_tutor.dart';
import 'package:frontend/Vista/Tutorado/tutorado_inicio.dart';
import 'package:frontend/Vista/Tutorado/tutorado_registrar_asistencia.dart';
import 'package:frontend/main.dart';

class RoutePagina {
  static FluroRouter router = FluroRouter();

  //POR DEFECTO
  static Handler _emptyHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params){
      return MyApp();
    }
  );

  //GENERAL
  static Handler _logIn = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return Login();
    }
  );

  //TUTOR PAR
  static Handler _tutorInicioHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorInicio();
    }
  );

  static Handler _tutorGenerarTutoria = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorGenerarTutoria();
    }
  );

  static Handler _tutorModificarTelefono = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorModificarTelefono();
    }
  );

  static Handler _tutorGenerarSesion = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorGenerarSesion();
    }
  );

  static Handler _tutorListarSesiones = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorListarSesiones();
    }
  );

  static Handler _tutorModificarTutoria = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorModificarTutoria();
    }
  );

  static Handler _tutorCoordinacion = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutorCoordinacion();
    }
  );


  //TUTORADO
  static Handler _tutoradoInicio = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutoradoInicio();
    }
  );

  static Handler _tutoradoRegistrarAsistencia = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutoradoRegistrarAsistencia();
    }
  );

  static Handler _tutoradoHistorico = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutoradoHistorico();
    }
  );

  static Handler _tutoradoHorarioTutor = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return TutoradoHorarioTutor();
    }
  );


  static void configureRoutes() {
    //GENERAL
    router.define('/login', handler: _logIn);
    //TUTOR PAR
    router.define('/tutor-par-inicio', handler: _tutorInicioHandler);
    router.define('/tutor-generar-tutoria', handler: _tutorGenerarTutoria);
    router.define('/tutor-modificar-telefono', handler: _tutorModificarTelefono);
    router.define('/tutor-generar-sesion', handler: _tutorGenerarSesion);
    router.define('/tutor-listar-sesiones', handler: _tutorListarSesiones);
    router.define('/tutor-modificar-tutoria', handler: _tutorModificarTutoria);
    router.define('/tutor-coordinacion', handler: _tutorCoordinacion);
    //TUTORADO
    router.define('/tutorado-inicio', handler: _tutoradoInicio);
    router.define('/tutorado-registrar-asistencia', handler: _tutoradoRegistrarAsistencia);
    router.define('/tutorado-historico', handler: _tutoradoHistorico);
    router.define('/tutorado-horario-tutor', handler: _tutoradoHorarioTutor);
    //POR DEFECTO
      router.notFoundHandler = _emptyHandler;
  }
}