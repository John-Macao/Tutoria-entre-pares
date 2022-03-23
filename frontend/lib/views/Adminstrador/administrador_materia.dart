
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
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Asignar/Quitar Materia", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: const SingleChildScrollView(
        child: materia(),
        //child: formularioMateria(),
      )
    );
  }
}

class materia extends StatelessWidget {
  const materia({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriaController>(
      init: MateriaController(locator.get<MateriaOfertaRepository>(),locator.get<UsuarioRepository>()),
      builder: (_){
        return Center(
          child: Container(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

              child: Column(
                children: [
                  const SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.buscar();

                      }, 
                      style: ElevatedButton.styleFrom(
                        primary : colorAzul,
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
                    ]
                  ),

                  const SizedBox(height: 50.0,
                    child: Divider(color: Colors.black,), 
                  ),

                  Container(
                  margin: EdgeInsets.symmetric(horizontal: 250),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Nombres:"
                        ),
                        controller: _.nombre,
                      ),
                      SizedBox(height: 2.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Carrera:"
                        ),
                        controller: _.carrera,
                      ),

                      SizedBox(height: 2.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Correo:"
                        ),
                        controller: _.correoTutor,
                      ),

                    ],

                  ),
                ),

                const SizedBox(height: 50.0,
                  child: Divider(color: Colors.black,), 
                ),

                Row(
                  children: [
                  SizedBox(
                    width: 500, //height: 500,
                    child: Center(
                      child: Card(
                        elevation: 1,
                        child: Column(
                          children: [
                            Text("Materias:", style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold, color: colorAzul 
                              ),
                              ),

                            Obx(()=>
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: _.listMateriasOfertadas.length,
                                itemBuilder: (context, index){
                                  return GetBuilder<MateriaController>(
                                    id: 'listaMateriaOfertadasUpdate',
                                    builder: (_){
                                      if (_.ver) {
                                        return Text("");
                                      }
                                      return Center(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                              Text(_.listMateriasOfertadas[index], style: TextStyle(fontSize: 15)),

                                              SizedBox( width: 15,),
                                              
                                              ElevatedButton(
                                                autofocus: _.ver,
                                                child: const Text(
                                                  "Deshabilitar",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              onPressed: (){
                                                _.deshabilitar(_.listMateriasOfertadas[index]);

                                                }, 
                                                style: ElevatedButton.styleFrom(
                                                  primary : colorAzulClaro,
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

                                              SizedBox( height: 40,),

                                                ]
                                              ),
                                            ],
                                        ),
                                      );
                                    }
                                  );
                                }
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 60,),

                  SizedBox(
                    width: 500,
                    child: Center(
                      child: Card(
                        elevation: 1,
                        child: Column(
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                const SizedBox(
                                  width: 50,
                                ),

                                Text("Calificación min:", style: TextStyle(fontSize: 20),),
                  
                                const SizedBox(
                                  width: 10,
                                ),
                                
                                SizedBox(
                                  width: 100, height: 23,
                                child: CupertinoTextField(
                                  controller: _.calificacion,
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  onPressed: (){
                                    _.buscarMaterias();

                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      primary : colorAzul,
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

                            SizedBox(height: 20,),

                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 50,
                                ),
                                
                                Text("Materia", style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold, color: colorAzul 
                                )),
                                
                                SizedBox(width: 60,),
                                
                                Text("Calificación", style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold, color: colorAzul 
                                ),),
                              ],
                            ),


                            Obx(()=>
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: _.listMateriasPosibles.length,
                                itemBuilder: (context, index){
                                  return GetBuilder<MateriaController>(
                                    id: 'listaMateriaPosiblesUpdate',
                                    builder: (_){
                                      if (_.ver2) {
                                        return Text("");
                                      }
                                      return Center(
                                          child: Column(
                                            children: [
                                              Row(
                                                //mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                              
                                              Text(_.listMateriasPosibles[index], style: TextStyle(fontSize: 15)),

                                              SizedBox( width: 90,),

                                              Text("Api U '80' ", style: TextStyle(fontSize: 15)),

                                              SizedBox( width: 100,),
                                              
                                              ElevatedButton(
                                                autofocus: _.ver,
                                                child: const Text(
                                                  "Agregar",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              onPressed: (){
                                                _.agregarMateria(_.listMateriasPosibles[index]);

                                                }, 
                                                style: ElevatedButton.styleFrom(
                                                  primary : colorAzulClaro,
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

                                              SizedBox( height: 40,),

                                                ]
                                              ),
                                            ],
                                        ),
                                      );
                                    }
                                  );
                                }
                              ),
                            ),

                          ],
                        ),


                      ),
                    ),
                  ),
                  ],
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
                        primary : colorAzul,
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
                      //child: Text(_.nombre, style: TextStyle(fontSize: 18)), 
                    ),
                    const Text("Carrera:  ", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 200,
                      //child: Text(_.carrera, style: TextStyle(fontSize: 18)), 
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
                    primary : colorAzul,
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