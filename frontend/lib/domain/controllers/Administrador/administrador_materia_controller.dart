
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class MateriaController extends GetxController{
  var nombre = TextEditingController();
  var carrera = TextEditingController();
  var cedula = TextEditingController();
  var calificacion = TextEditingController();
  var materias = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if(MsalService.rol!='Administrador'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  eliminar(){
    print("Quita los datos :  ----" );
  }

  buscar(){
    nombre.text = "John";
    carrera.text= "Computación";
  }
  
  buscarMaterias(){
    materias.text = "Fisica,   Ecuaciones Diferenciales";
  }



}