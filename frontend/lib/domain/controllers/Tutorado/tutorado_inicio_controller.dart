import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/Tutor/tutor_inicio.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoInicioController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  final HorarioRepository _horarioRepository;
  var codigo = TextEditingController();
  bool _comprobar = false;
  bool get comprobar => _comprobar;

  TutoradoInicioController(this._usuarioRepository, this._horarioRepository);

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

  Future<bool?> verificaSesionCodigo(String cod) async {
    try {
      var code = int.parse(cod);
      await _horarioRepository.fetch_horarios_id(code);
      
      final data = await _horarioRepository.fetch_horarios_id(code);
      //var t =data!.horTipo;
      //print(t);

      if (data!.horTipo == "Sesion") {
        //print("1");
        return true;
      }else {
      //print("2");
      return false;
      }
      
    } catch (e) {
      //print("3");
      return false;
    }
  }
  
  
}