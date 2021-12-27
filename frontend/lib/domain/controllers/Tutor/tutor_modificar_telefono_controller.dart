import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorModificarTelefonoController extends GetxController{
  
  String nombre ='';
  var numero = TextEditingController();
  
  @override
  void onInit(){
    super.onInit();
    if(MsalService.rol!='Tutor'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    //con conexion a base de datos
    nombre = 'Pablo Esteban Loja Morocho';
    numero.text = '0998476387';
  }

  modificar(){
    print('Se manda a guardadr este numero: ' + numero.text);
  }
  
}