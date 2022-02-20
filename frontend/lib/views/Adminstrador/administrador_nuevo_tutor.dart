
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_agregar_tutor_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaNuevoTutor extends StatelessWidget {
  const VistaNuevoTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimario,
        title: Container( alignment: Alignment.center, child: Text("Nuevo Tutor Par", style: TextStyle(fontSize: 23),)),
      ),
      
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: const SingleChildScrollView( 
        child: formularioNuevoTutor(),
      ),
    );
  }
}

class formularioNuevoTutor extends StatelessWidget {
  const formularioNuevoTutor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgregarNuevoTutorController>(
      init: AgregarNuevoTutorController(locator.get<UsuarioRepository>()) ,
      builder: (_){
        return Center(
          
          child: Container(
            //padding: EdgeInsets.all(50.0),
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 50 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Cédula :", style: TextStyle(fontSize: 20),),
                    
                    SizedBox(
                      width: 160, height: 25,
                    child: CupertinoTextField(
                      controller: _.cedula,
                    ),
                    ),

                    TextButton(
                      onPressed: (){
                        _.buscar();
                      }, 
                      child: Text('Buscar', style: TextStyle(fontSize: 20))
                    ),
                  ],
                ),

                SizedBox(height: 50.0,
                  child: Divider(color: Colors.black,), 
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Nombre:    " + _.nombre , style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 160, height: 25,
                    child: Text(_.nombre),
                    ),

                    Text("Correo: " + _.correo, style: TextStyle(fontSize: 20)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Carrera: " + _.carrera, style: TextStyle(fontSize: 20)),
                    Text("Telefono: " + _.telefono, style: TextStyle(fontSize: 20)),
                  ],
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Nivel: " + _.nivel, style: TextStyle(fontSize: 20)),
                  ],
                ),
                
                TextButton(
                  onPressed: (){
                    _.agregar(context);
                  }, 
                  child: Text("Agregar como tutor")
                ),
              ],
            ),
            ),
          ),
        );
        
      }
      
    );
  }
}