import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/views/General/login.dart';
import 'package:frontend/views/General/verificar_login.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:frontend/views/routes/router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //router
  RoutePagina.configureRoutes();
  setPathUrlStrategy();

  //MsalService.initialize();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor:Colors.indigo[50],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tutoria Entre Pares',
      
      initialRoute: '/verificar-login',
      //initialRoute: '/administrador-principal',
      onGenerateRoute: RoutePagina.router.generator,
      home: VerificarLogin(),
    );
  }
}
