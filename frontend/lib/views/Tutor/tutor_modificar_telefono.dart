import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_modificar_telefono_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorModificarTelefono extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Teléfono'),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: TutorMenu.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              formularioTelefono(),
            ],
          ),
        ),
      ),
    );
  }
}


class formularioTelefono extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTelefonoController>(
      init: TutorModificarTelefonoController(locator.get<UsuarioRepository>()),
      builder: (_){
        return Form(
          child: Column(
            children: [
              Text('Tutor par:'),
              Text(_.nombre),
              Text('Numero:'),
              CupertinoTextField(
                controller: _.numero,
              ),
              TextButton(
                onPressed: (){
                  _.modificar();
                }, 
                child: Text('Actualizar')
              ),
            ],
          )
        );
      }
    );
  }
}