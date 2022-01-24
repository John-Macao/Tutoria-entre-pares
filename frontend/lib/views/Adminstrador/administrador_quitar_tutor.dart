
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_quitar_tutor_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
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
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
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
              Text(_.nombre),
              Text("Correo: "),
              Text(_.correo),
              Text("Carrera: "),
              Text(_.carrera),
              Text("Telefono: "),
              Text(_.telefono),
              Text("Nivel: "),
              Text(_.nivel),
              Text("Materias:"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.listMaterias.length,
                itemBuilder: (context, index){
                  return Text(_.listMaterias[index]);
                }
              ),


              TextButton(
                onPressed: (){
                  _.eliminar(context);
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