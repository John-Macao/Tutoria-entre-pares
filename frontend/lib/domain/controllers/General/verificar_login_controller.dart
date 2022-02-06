import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class VerificarLoginController extends GetxController {

  final UsuarioRepository _usuarioRepository;


  //luego de iniciar sesion se redirige a esta pagina donde segun el rol del usuario, se redirige al inicio del usuario
  
  var cor = '';
  var rol = '';

  BuildContext? context;

  VerificarLoginController(this.context, this._usuarioRepository);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    proceso();
  }

  Future proceso() async{
    await MsalService(_usuarioRepository).getCurrentUser();
    //print(MsalService.rol);

    //js.context.callMethod('redireccion', [MsalService.rol]);
    //print(MsalService.rol);
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    rol = (await MsalService(_usuarioRepository).getRol(cor))!;
    switch (rol) {
      case 'Administrador':
          Navigator.pushNamed(context!, '/administrador-principal');
          break;
      case 'Tutor':
          Navigator.pushNamed(context!, '/tutor-par-inicio');
          break;
      case 'Tutorado':
          Navigator.pushNamed(context!, '/tutorado-inicio');
          break;
      default:
          Navigator.pushNamed(context!, '/login');
          break;
    }
  }

}