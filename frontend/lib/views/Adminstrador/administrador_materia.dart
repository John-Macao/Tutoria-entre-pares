
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_materia_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaMateria extends StatelessWidget {
  const VistaMateria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimario,
        title: Container( alignment: Alignment.center, child: Text("Asignar/Quitar Materia", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: const SingleChildScrollView(
        child: formularioMateria(),
      )
    );
  }
}

class formularioMateria extends StatelessWidget {
  const formularioMateria({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriaController>(
      init: MateriaController(locator.get<MateriaOfertaRepository>(),locator.get<UsuarioRepository>()),
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
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    const Text("Nombre:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.nombre, style: TextStyle(fontSize: 18)), 
                    ),
                    const Text("Carrera:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      child: Text(_.carrera, style: TextStyle(fontSize: 18)), 
                    ),
                  ],
                ),
                const SizedBox(height: 50.0,
                  child: Divider(color: Colors.black,), 
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Column(
                      children: [
                        const Text("Materias: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            /*ListView.builder(
                              itemCount: 3,
                              itemBuilder: ,
                              )
                              */
                          ],
                        )

                      ],
                      
                    )

                  ]
                ),


                
                
                ElevatedButton(
                  child: const Text(
                    "Aceptar --- ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  ), onPressed: () {  },
                ),
                const SizedBox(
                    height: 50,
                ),
              ],
            ),
            ),
          ),
        );

      },
    );
  }
}