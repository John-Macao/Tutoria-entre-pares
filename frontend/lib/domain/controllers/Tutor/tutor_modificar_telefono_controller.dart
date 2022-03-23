import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorModificarTelefonoController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  
  String nombre ='';
  var numero = TextEditingController();

  var cor = '';
  var rol = '';

  TutorModificarTelefonoController(this._usuarioRepository);
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    rol = (await MsalService(_usuarioRepository).getRol(cor))!;
    if(rol!='Tutor'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    
    loadDatos();

  }

  Future loadDatos()async{
    nombre = (await _usuarioRepository.fetch_usuario_nombre(cor))!;

    numero.text = (await _usuarioRepository.fetch_usuario_telefono(cor))!;

    update();
  }

  Future<bool> modificar()async{
    try {
      final insertar = await _usuarioRepository.update_usuario_telefono(cor,numero.text);
      loadDatos();
      return true;
      
    } catch (e) {
      return false;
    }
    
  }
  
}