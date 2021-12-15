import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class QuitarTutorController extends GetxController{
  var nombre = TextEditingController();
  var correo = TextEditingController();
  var apellido = TextEditingController();
  var carrera = TextEditingController();
  var telefono = TextEditingController();
  var nivel = TextEditingController();
  var cedula = TextEditingController();
  var n = TextEditingController();
  var materia1 = "Algebra Lineal";
  var materia2 = "Ecuaciones ";
  var materia3 = "Base de datos";
  
  @override
  void onInit() {
    super.onInit();
    if(MsalService.rol!='administrador'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }
  

  eliminar(){
    print("Quita los datos :  ----" );
  }

  buscar(){
    nombre.text = "John";
    correo.text = "johnm@gmail.com";
    apellido.text = "Macao";
    carrera.text= "Computación";
    telefono.text = "0989449535";
    nivel.text = "noveno";
    n.text = "Algebra Lineal,  Ecuaciones,  Base de datos";
  }

  
}