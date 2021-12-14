import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_service_locator.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/controllers/General/service_locator_general.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_service_locator.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_service_locator.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:frontend/views/routes/router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //router
  RoutePagina.configureRoutes();
  setPathUrlStrategy();

  MsalService.initialize();

  setupGetItGeneral();
  setupGetItAdministrador();
  setupGetItTutor();
  setupGetItTutorado();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Color(0xFFF3F9F6),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tutoria Entre Pares',
      initialRoute: '/tutor-par-inicio',
      onGenerateRoute: RoutePagina.router.generator,
      home: TutorInicio(),
    );
  }
}
