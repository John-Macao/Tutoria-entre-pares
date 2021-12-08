
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_quitar_tutor_controller.dart';
import 'package:get/get.dart';

class VistaQuitarTutor extends StatelessWidget {
  const VistaQuitarTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("Quitar Tutor Par"),
      ),
      drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: formularioQuitarTutor(),
        ),
      )
    );
  }
}

class formularioQuitarTutor extends StatelessWidget {
  const formularioQuitarTutor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuitarTutorController>(
      init: QuitarTutorController() ,
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

              Card(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _.n,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Materias ',
                    ),
                  ), 
                ),
              ),

              TextButton(
                onPressed: (){
                  _.eliminar();
                }, 
                child: Text("Eliminar ")
                ),

            ],
           
          )
          
          );
      }
      
    );
  }
}