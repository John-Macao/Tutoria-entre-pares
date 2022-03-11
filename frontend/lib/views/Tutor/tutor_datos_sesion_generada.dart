import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_datos_sesion_generada_controller.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:get/get.dart';

class TutorDatosSesionGenerada extends StatelessWidget{
  final String horarioId;
  TutorDatosSesionGenerada({Key? key, required this.horarioId}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Datos de Sesión", style: TextStyle(fontSize: 23),)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: GetBuilder<TutorDatosSesionGeneradaController>(
            init: TutorDatosSesionGeneradaController(int.parse(horarioId), locator.get<UsuarioRepository>(), locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>()),
            builder: (_){
              return Container(
                child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox( height: 50, ),
                      Text("Datos de la Sesión Generada", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold) ,),

                      const SizedBox( height: 50, ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tutor Par: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          const SizedBox( width: 25, ),
                          Text(_.nombre.text, style: TextStyle(fontSize: 20)),

                        ],
                      ),

                      const SizedBox( height: 30, ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fecha: " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox( width: 25, ),
                          Text(_.horario.horFehca.toString(), style: TextStyle(fontSize: 20)),
                          
                        ],
                      ),

                      const SizedBox( height: 30, ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hora: " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox( width: 25, ),
                          Text(_.horario.horHora, style: TextStyle(fontSize: 20)),
                          
                        ],
                      ),

                      const SizedBox( height: 30, ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Asignatura: " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox( width: 25, ),
                          Text(_.asignatura.text, style: TextStyle(fontSize: 20)),
                        ],
                      ),

                      const SizedBox( height: 30, ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sesión: " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox( width: 25, ),
                          Text(_.horario.horId.toString(), style: TextStyle(fontSize: 20)),

                        ],
                      ),

                      const SizedBox( height: 30, ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Enlace: " , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox( width: 25, ),
                          SelectableText('http://localhost:64790//tutorado-registrar-asistencia/'+_.horario.horId.toString()),

                        ],
                      ),

                      const SizedBox( height: 40, ),
                      
                      
                      ElevatedButton(
                        child: const Text(
                          "Salir",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/tutor-par-inicio');
                        //Navigator.pop(context);

                        }, 
                        style: ElevatedButton.styleFrom(
                          primary : colorRojo,
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
                      const SizedBox( height: 30, ),
                    ],

                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

