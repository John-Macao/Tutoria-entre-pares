import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class VerificarLoginController extends GetxController {


  //luego de iniciar sesion se redirige a esta pagina donde segun el rol del usuario, se redirige al inicio del usuario
  
    @override
  void onInit() {
    super.onInit();
    MsalService().getCurrentUser();
    //print(MsalService.rol);

    js.context.callMethod('redireccion', [MsalService.rol]);

  
  }

}