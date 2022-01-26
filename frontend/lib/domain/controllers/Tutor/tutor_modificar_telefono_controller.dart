import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorModificarTelefonoController extends GetxController{
  
  String nombre ='';
  var numero = TextEditingController();

  var cor = '';
  var rol = '';
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService().getCorreo())!; 
    rol = (await MsalService().getRol(cor))!;
    if(rol!='Tutor'){
      MsalService().getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    
    loadDatos();

  }

  Future loadDatos()async{
    nombre = (await Usuario_api.instace.fetch_usuario_nombre(cor))!;

    numero.text = (await Usuario_api.instace.fetch_usuario_telefono(cor))!;

    update();
  }

  Future modificar()async{
    final insertar = await Usuario_api.instace.update_usuario_telefono(cor,numero.text);
    loadDatos();
  }
  
}