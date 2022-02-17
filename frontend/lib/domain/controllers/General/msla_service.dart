import 'dart:js' as js;
import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';


//clase que se encarga del inicio de sesion
//esta clase sera llamada solo una vez en el main.dart
class MsalService extends GetxController {

  

  final UsuarioRepository _usuarioRepository;

  final Rx<UserLogIn> _userLogin = Rx<UserLogIn>(UserLogIn());
  static String correo ='';
  static String rol ='';

  // static initialize() {
  //   Get.put(MsalService(_usuarioRepository));
  // }

  MsalService(this._usuarioRepository){
    print("------------");
    print(this._usuarioRepository);
    print("------------");

    js.context.callMethod('msalInitialize');
    getCurrentUser();
  }

  

  //inicio de sesion que llama al metodo en javascript
  login(BuildContext context) {
    js.context.callMethod('login', []);
  }

  //obtiene los datos del usuario que ingreso al sistema y se guarda el correo
  Future getCurrentUser() async {
    try {
        UserLogIn? user = UserLogIn.fromJson(js.JsObject.fromBrowserObject(js.context.callMethod('getCurrentUser', [])));
      if (user != null) {
        _userLogin.value = user;
        _userLogin.refresh();

        correo = user.username!;
        print("VER USUARIO RETORNO DE BASE -------");
        print(correo);
        
        await verificarUsuario();
        //return user;
      }
    } catch (e) {
      UserLogIn? user;
    } 
  }

  logout(BuildContext context){
    js.context.callMethod('logout', []);
  }

    //se verifica el rol de un usuario segun su correo electronico
  Future verificarUsuario() async{
    
    final data = await _usuarioRepository.fetch_usuario_rol(MsalService.correo);
    rol = data!;

/*
    if(correo == 'ploja1@hotmail.com'){
      rol = 'Tutor';
    }else if (correo == 'plojam@est.ups.edu.ec') {
      rol = 'Administrador';
    }else if (correo == 'ploja1@live.com'){
      rol = 'Tutorado';
    }else{
      rol = '';
    }*/

  }

  Future<String?> getCorreo() async{
    try {
        UserLogIn? user = UserLogIn.fromJson(js.JsObject.fromBrowserObject(js.context.callMethod('getCurrentUser', [])));
      if (user != null) {
        _userLogin.value = user;
        _userLogin.refresh();

        correo = user.username!;
        return correo;
      }
    } catch (e) {
      return '';
    } 
  }

  Future<String?> getRol(correou) async{
    try {
      final data = await _usuarioRepository.fetch_usuario_rol(correou);
      rol = data!;
      return rol;
    } catch (e) {
      return '';
    }
    
  }

}

