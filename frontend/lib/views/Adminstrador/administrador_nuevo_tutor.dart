
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_agregar_tutor_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
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
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
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
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text("Cédula : "),
                      
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