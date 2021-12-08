import 'package:flutter/material.dart';

class LoginController {
  final loginNotifier = ValueNotifier<loginState>(loginState.inicio);

  final textCorreo = TextEditingController();
  final textContrasena = TextEditingController();

  void comprobarLogin(BuildContext context){
    if(textCorreo.text == 'administrador' && textContrasena.text == 'administrador'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else if(textCorreo.text == 'tutor' && textContrasena.text == 'tutor'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else if(textCorreo.text == 'tutorado' && textContrasena.text == 'tutorado'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else {
      loginNotifier.value = loginState.incorrecto;
    }
  }
}


enum loginState{
  inicio,
  incorrecto,
  correcto,
}