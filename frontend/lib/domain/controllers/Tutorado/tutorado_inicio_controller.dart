import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoInicioController extends GetxController{
  
  var codigo = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Tutorado'){
      MsalService().getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  
  
}