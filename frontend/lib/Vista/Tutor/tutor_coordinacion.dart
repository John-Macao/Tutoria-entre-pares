import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Tutor/tutor_coordinacion_controller.dart';
import 'package:frontend/Vista/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorCoordinacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorCoordinacionController>(
      init: TutorCoordinacionController(),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Tutor Par Inicio'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TutorMenu(),
                Form(child: Column(
                  children: [
                    Text('Materia: '),
                    Obx(() =>
                        DropdownButton<String>(
                        hint: Text('Seleccionar dia'),
                        value: _.asignatura.value,
                        onChanged: (String? seleccionado){
                          _.asignatura.value = seleccionado!;
                        },
                        items: _.listAsignatura
                              .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                            );
                        }).toList(),
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        _.consultar();
                      }, 
                      child: Text('Consultar')
                    ),
                    
                    Text('Docente: '),
                    Obx(() =>
                        DropdownButton<String>(
                        hint: Text('Seleccionar dia'),
                        value: _.docente.value,
                        onChanged: (String? seleccionado){
                          _.docente.value = seleccionado!;
                        },
                        items: _.listDocente
                              .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                            );
                        }).toList(),
                      ),
                    ),
                    Text('Comentario: '),
                    CupertinoTextField(
                      controller: _.comentario,
                    ),
                    

                    TextButton(
                      onPressed: (){
                        _.guardar();
                      }, 
                      child: Text('Guardar')
                    ),

                  ],
                )
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

