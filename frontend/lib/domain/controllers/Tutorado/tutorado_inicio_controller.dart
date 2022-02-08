import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoInicioController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  
  var codigo = TextEditingController();

  TutoradoInicioController(this._usuarioRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService(_usuarioRepository).getCorreo(); 
    var rol = await MsalService(_usuarioRepository).getRol(cor);
    if(rol!='Tutorado'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  
  
}