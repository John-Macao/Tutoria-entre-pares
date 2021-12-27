
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class AgregarNuevoTutorController extends GetxController {

  var nombre = TextEditingController();
  var correo = TextEditingController();
  var apellido = TextEditingController();
  var carrera = TextEditingController();
  var telefono = TextEditingController();
  var nivel = TextEditingController();
  var cedula = TextEditingController();

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

  agregar(){
    print("guarda los datos :  ----" + nombre.text );
  }

  buscar(){
    nombre.text = "John";
    correo.text = "johnm@gmail.com";
    apellido.text = "Macao";
    carrera.text= "Computación";
    telefono.text = "0989449535";
    nivel.text = "noveno";
  }

}

