
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Administrador/inicio_controller.dart';
import 'package:frontend/Controlador/Administrador/agregar_nuevo_tutor_controller.dart';
import 'package:frontend/Controlador/Administrador/menu_controller.dart';
import 'package:get/get.dart';

class VistaNuevoTutor extends StatelessWidget {
  const VistaNuevoTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tutor Par'),
      ),
      drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: formularioNuevoTutor(),
        ),
      )
    );
  }
}

class formularioNuevoTutor extends StatelessWidget {
  const formularioNuevoTutor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgregarNuevoTutorController>(
      init: AgregarNuevoTutorController() ,
      builder: (_){
        return Form(
          child: Column(
            children: [
              Text("Cédula: "),
              CupertinoTextField(
                controller: _.cedula,
              ),
              TextButton(
                onPressed: (){
                  _.buscar();
                }, 
                child: Text("Buscar")
                ),

                Text("Nombre: "),
                CupertinoTextField(
                controller: _.nombre,
              ),
              Text("Apellido: "),
                CupertinoTextField(
                controller: _.apellido,
              ),
              Text("Correo: "),
                CupertinoTextField(
                controller: _.correo,
              ),
              Text("Carrera: "),
                CupertinoTextField(
                controller: _.carrera,
              ),
              Text("Telefono: "),
                CupertinoTextField(
                controller: _.telefono,
              ),
              Text("Nivel: "),
                CupertinoTextField(
                controller: _.nivel,
              ),

              TextButton(
                onPressed: (){
                  _.agregar();
                }, 
                child: Text("Agregar")
                ),

            ],
           
          )
          
          );
      }
      
    );
  }
}