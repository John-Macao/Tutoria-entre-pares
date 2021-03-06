import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/controllers/General/verificar_login_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';


class VerificarLogin extends StatelessWidget {
  const VerificarLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificarLoginController>(
      init: VerificarLoginController(context, locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
          //appBar: AppBar(title: Text('Tutorías entre pares'),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator()
              ],
            ),
          ),
        );
      }
    );
  }
}
