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
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

            child: Column(
              children: <Widget>[
                const SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Cédula :", style: TextStyle(fontSize: 20),),
                    
                    const SizedBox(
                      width: 10,
                    ),
                    
                    SizedBox(
                      width: 160, height: 23,
                    child: CupertinoTextField(
                      controller: _.cedula,
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    ElevatedButton(
                      child: const Text(
                        "Buscar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.buscar();

                      }, 
                      style: ElevatedButton.styleFrom(
                        primary : colorPrimario,
                        shape:
                        const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                            Radius.circular(10),
                          bottomRight:
                            Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50.0,
                  child: Divider(color: Colors.black,), 
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text("Nombre:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.nombre, style: TextStyle(fontSize: 18)), 
                    ),
                    const Text("Correo:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.correo, style: TextStyle(fontSize: 18)), 
                    ),
                  ],
                ),
                const SizedBox(
                    height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text("Carrera:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.carrera, style: TextStyle(fontSize: 18)), 
                    ),
                    const Text("Telefono:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.telefono, style: TextStyle(fontSize: 18)), 
                    ),
                  ],
                ),
                const SizedBox(
                    height: 50,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text("Nivel:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.nivel, style: TextStyle(fontSize: 18)), 
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                  ],
                ),
                const SizedBox(
                    height: 25,
                ),
                
                ElevatedButton(
                  child: const Text(
                    "Agregar Tutor",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                onPressed: (){
                  _.agregar(context);

                  }, 
                  style: ElevatedButton.styleFrom(
                    primary : colorPrimario,
                    shape:
                    const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                        Radius.circular(10),
                      bottomRight:
                        Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  ),
                ),
                const SizedBox(
                    height: 50,
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