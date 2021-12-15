import 'dart:js' as js;
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:get/get.dart';


//clase que se encarga del inicio de sesion
//esta clase sera llamada solo una vez en el main.dart
class MsalService extends GetxController {

  final Rx<UserLogIn> _userLogin = Rx<UserLogIn>(UserLogIn());
  static String correo ='';
  static String rol ='';

  static initialize() {
    Get.put(MsalService());
  }

  @override
  void onInit() {
    super.onInit();
    js.context.callMethod('msalInitialize');
    getCurrentUser();
  }

  //inicio de sesion que llama al metodo en javascript
  login(BuildContext context) {
    js.context.callMethod('login', []);
  }

  //obtiene los datos del usuario que ingreso al sistema y se guarda el correo
  getCurrentUser() {
    try {
        UserLogIn? user = UserLogIn.fromJson(js.JsObject.fromBrowserObject(js.context.callMethod('getCurrentUser', [])));
      if (user != null) {
        _userLogin.value = user;
        _userLogin.refresh();

        correo = user.username!;
        verificarUsuario();
        //return user;
      }
    } catch (e) {
      UserLogIn? user;
    } 
  }

    //se verifica el rol de un usuario segun su correo electronico
    verificarUsuario(){
    //aqui con el correo se verifica en la base de datos que permiso tiene
    //se asignan permisos por el momento sin revisar la base
    if(correo == 'ploja1@hotmail.com'){
      rol = 'tutor';
    }else if (correo == 'plojam@est.ups.edu.ec') {
      rol = 'administrador';
    }else if (correo == 'ploja1@live.com'){
      rol = 'tutorado';
    }else{
      rol = '';
    }

  }
}

