
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Administrador/administrador_principal_controller.dart';
import 'package:frontend/Controlador/Administrador/administrador_materia_controller.dart';
import 'package:frontend/Controlador/Administrador/administrador_menu_controller.dart';
import 'package:get/get.dart';

class VistaMateria extends StatelessWidget {
  const VistaMateria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("Asignar/Quitar Materia"),
      ),
      drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: formularioMateria(),
        ),
        
      )
    );
  }
}

class formularioMateria extends StatelessWidget {
  const formularioMateria({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriaController>(
      init: MateriaController(),
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
              Text("Carrera: "),
                CupertinoTextField(
                controller: _.carrera,
              ),

              Text("Materias: "),
              Text("Algebra Lineal"),
              TextButton(
                onPressed: (){
                }, 
                child: Text("Deshabilitar")
                ),
              Text("Base de Datos"),
              TextButton(
                onPressed: (){
                }, 
                child: Text("Deshabilitar")
                ),

              Text("Calificación minima: "),
              CupertinoTextField(
                controller: _.calificacion,
              ),
              TextButton(
                onPressed: (){
                  _.buscarMaterias();
                }, 
                child: Text("Buscar")
                ),
                CupertinoTextField(
                controller: _.materias,
              ),
    

              TextButton(
                onPressed: (){
                  _.eliminar();
                }, 
                child: Text("Agregar ")
                ),

            ],
           
          )
          
          
          );
          

      },
      
    );
  }
}