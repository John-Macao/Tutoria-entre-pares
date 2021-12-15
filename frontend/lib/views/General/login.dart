import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/General/login_controller.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_service_locator.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MostrarBoton(),
          ],
        ),
      ),
    );
  }
}

class MostrarBoton extends StatelessWidget{
  MostrarBoton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_){
        return TextButton(
          onPressed: (){
            _.login(context);
          }, 
          child: Text('Iniciar Sesión')
        );
      }
    );
  }
}
