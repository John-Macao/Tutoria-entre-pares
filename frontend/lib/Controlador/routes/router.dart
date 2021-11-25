import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Vista/Tutor/tutor_generar_tutoria.dart';
import 'package:frontend/Vista/Tutor/tutor_inicio.dart';
import 'package:frontend/Vista/Tutor/tutor_modificar_telefono.dart';
import 'package:frontend/main.dart';

class RoutePagina {
  static FluroRouter router = FluroRouter();

  

  static Handler _emptyHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params){
      return MyApp();
    }
  );

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



  static void configureRoutes() {
    router.define('/tutor-par-inicio', handler: _tutorInicioHandler);
    router.define('/tutor-generar-tutoria', handler: _tutorGenerarTutoria);
    router.define('/tutor-modificar-telefono', handler: _tutorModificarTelefono);
      router.notFoundHandler = _emptyHandler;
  }
}