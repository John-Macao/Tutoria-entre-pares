

import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/estudiantes.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class PrincipalController extends GetxController{
  List<Estudiantes> estudiante = <Estudiantes>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};
  
  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Administrador'){
      MsalService().getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    estudiante.add(Estudiantes(id: 1, cedula: "0105824478", nombres: "Juan Benitez", materia: "Algebra Lineal", calificacion: "85", carrera: "Automotriz" ));
    estudiante.add(Estudiantes(id: 2, cedula: "0104323456", nombres: "Andrea Cardenas", materia: "Algebra Lineal", calificacion: "89", carrera: "Computación" ));
    estudiante.add(Estudiantes(id: 3, cedula: "0104386795", nombres: "Omar Rodrigez", materia: "Algebra Lineal", calificacion: "80", carrera: "Computación" ));

  }

}

