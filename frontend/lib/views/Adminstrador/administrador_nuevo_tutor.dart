
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_agregar_tutor_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:get/get.dart';
import 'package:frontend/util/style.dart' as style;

class VistaNuevoTutor extends StatelessWidget {
  const VistaNuevoTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tutor Par'),
        backgroundColor:Color.fromARGB(style.aA, style.aR, style.aG, style.aB ),
      ),
      drawer: Menu.getDrawer(context),
      body: formularioNuevoTutor ()
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
        return Center(
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text("Cédula: ", style: TextStyle(fontSize: 22.0)),
                      SizedBox(
                        width: 150.0,
                        height: 28.0,
                        child: CupertinoTextField(
                          controller: _.cedula,
                        ),
                      ),
                      TextButton(
                        child: Text("Buscar", style: TextStyle(fontSize: 22.0)),
                        onPressed: () {

                        },
                      ),
                      
                      
                      /*
                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                        child: TextButton(
                          onPressed: () {
                            
                          }, child: Text(" Buscar "),
                        ),
                      ),
                      */
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        
      }
      
    );
  }
}