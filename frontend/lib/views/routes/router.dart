import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/views/Adminstrador/administrador_filtrar_estudiantes.dart';
import 'package:frontend/views/Adminstrador/administrador_materia.dart';
import 'package:frontend/views/Adminstrador/administrador_nuevo_tutor.dart';
import 'package:frontend/views/Adminstrador/administrador_principal.dart';
import 'package:frontend/views/Adminstrador/administrador_quitar_tutor.dart';
import 'package:frontend/views/Adminstrador/administrador_reporte_tutorados.dart';
import 'package:frontend/views/Adminstrador/administrador_reporte_tutorias.dart';
import 'package:frontend/views/General/login.dart';
import 'package:frontend/views/General/verificar_login.dart';
import 'package:frontend/views/Tutor/totur_listar_sesiones.dart';
import 'package:frontend/views/Tutor/tutor_coordinacion.dart';
import 'package:frontend/views/Tutor/tutor_generar_sesion.dart';
import 'package:frontend/views/Tutor/tutor_generar_tutoria.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:frontend/views/Tutor/tutor_modificar_telefono.dart';
import 'package:frontend/views/Tutor/tutor_modificar_tutoria.dart';
import 'package:frontend/views/Tutorado/tutorado_historico.dart';
import 'package:frontend/views/Tutorado/tutorado_horario_tutor.dart';
import 'package:frontend/views/Tutorado/tutorado_inicio.dart';
import 'package:frontend/views/Tutorado/tutorado_registrar_asistencia.dart';

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

  static Handler _verificarLogIn = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VerificarLogin();
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

  // ADMINISTRADOR 

  static Handler _administradorInicio = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaPrincipal();
    }
  );

  static Handler _administradorNuevoTutor = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaNuevoTutor();
    }
  );

  static Handler _administradorQuitarTutor = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaQuitarTutor();
    }
  );

  static Handler _administradorMateria = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaMateria();
    }
  );

  static Handler _administradorReporteTutorias = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaReporteTutorias();
    }
  );

  static Handler _administradorReporteTutorados = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaReporteTutorados();
    }
  );

  static Handler _administradorFiltrarEstudiantes = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return VistaFiltrarEstudiantes();
    }
  );

//----------------------------------BORRAR
  // static Handler _borrar = Handler(
  //   handlerFunc: (BuildContext? context, Map<String, dynamic> params){
  //     return BorrarModificarHorario();
  //   }
  // );



  static void configureRoutes() {
    //GENERAL
    router.define('/login', handler: _logIn);
    router.define('/verificar-login', handler: _verificarLogIn);
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

    //ADMIN
    router.define("/administrador-principal", handler: _administradorInicio);
    router.define("/administrador-nuevo-tutor", handler: _administradorNuevoTutor);
    router.define("/administrador-quitar-tutor", handler: _administradorQuitarTutor);
    router.define("/administrador-materia", handler: _administradorMateria);
    router.define("/administrador-reporte-tutorias", handler: _administradorReporteTutorias);
    router.define("/administrador-reporte-tutorados", handler: _administradorReporteTutorados);
    router.define("/administrador-filtro-estudiantes", handler: _administradorFiltrarEstudiantes);

    //-----------------------------BORRAR
    // router.define("/borrar", handler: _borrar);
    

  }
}