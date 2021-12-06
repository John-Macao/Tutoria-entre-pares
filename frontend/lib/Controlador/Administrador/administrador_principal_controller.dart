

import 'package:frontend/Modelo/estudiantes.dart';
import 'package:frontend/Vista/Adminstrador/administrador_nuevo_tutor.dart';
import 'package:frontend/Vista/Adminstrador/administrador_principal.dart';
import 'package:frontend/Vista/Adminstrador/administrador_quitar_tutor.dart';
import 'package:get/get.dart';
import 'package:frontend/Modelo/tutor_horario.dart';

class PrincipalController extends GetxController{
  
  //porque aun no hay conexion con la base de datos
  List<Estudiantes> estudiante = <Estudiantes>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};
  
  @override
  void onInit(){
    super.onInit();
    estudiante.add(Estudiantes(id: 1, cedula: "0105824478", nombres: "Juan Benitez", materia: "Algebra Lineal", calificacion: "85", carrera: "Automotriz" ));
    estudiante.add(Estudiantes(id: 2, cedula: "0104323456", nombres: "Andrea Cardenas", materia: "Algebra Lineal", calificacion: "89", carrera: "Computación" ));
    estudiante.add(Estudiantes(id: 3, cedula: "0104386795", nombres: "Omar Rodrigez", materia: "Algebra Lineal", calificacion: "80", carrera: "Computación" ));

  }

}

