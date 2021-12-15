import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoInicioController extends GetxController{
  
  var codigo = TextEditingController();

  @override
  void onInit(){
    super.onInit();
    if(MsalService.rol!='tutorado'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  
  
}