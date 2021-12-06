import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Tutor/tutor_generar_sesion_controller.dart';
import 'package:frontend/Vista/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorGenerarSesion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Sisión Tutorial'),
      ),
      drawer: TutorMenu.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              formularioGenerarSesion(),
            ],
          ),
        ),
      ),
    );
  }
}


class formularioGenerarSesion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorGenerarSesionController>(
      init: TutorGenerarSesionController(),
      builder: (_){
        return Form(
          child: Column(
            children: [
              Text('Tutor par:'),
              Text(_.nombre),
              Text('Asignaruta:'),
              Obx(() =>
                DropdownButton<String>(
                hint: Text('Seleccionar asignatura'),
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
                  _.generarSesion();
                }, 
                child: Text('Generar sesion tutorial')
              ),
            ],
          )
        );
      }
    );
  }
}