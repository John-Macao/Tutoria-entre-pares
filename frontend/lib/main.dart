import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Administrador/administrador_service_locator.dart';
import 'package:frontend/Controlador/General/service_locator_general.dart';
import 'package:frontend/Controlador/Tutor/tutor_service_locator.dart';
import 'package:frontend/Controlador/Tutorado/tutorado_service_locator.dart';
import 'package:frontend/Vista/General/login.dart';

void main() {
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
      home: Login(),
    );
  }
}
