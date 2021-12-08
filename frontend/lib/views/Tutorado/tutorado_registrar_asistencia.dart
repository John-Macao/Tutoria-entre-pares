import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_registrar_asistencia_controller.dart';
import 'package:get/get.dart';

class TutoradoRegistrarAsistencia extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoRegistrarAsistenciaController>(
      init: TutoradoRegistrarAsistenciaController(),
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
                  Text('Tutor Par'),
                  Text(_.tutorPar),
                  Text('#Horas:'),
                  Obx(() =>
                      DropdownButton<String>(
                      hint: Text('Seleccionar #horas'),
                      value: _.hora.value,
                      onChanged: (String? seleccionado){
                        _.hora.value = seleccionado!;
                      },
                      items: _.listHoras
                            .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          );
                      }).toList(),
                    ),
                  ),
                  Text('Tema:'),
                  CupertinoTextField(
                    controller: _.tema,
                  ),
                  Text('Docente:'),
                  Obx(() =>
                      DropdownButton<String>(
                      hint: Text('Seleccionar docente'),
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
                  Text('¿Quién le incentivo a asistir a las tutorías?:'),
                  Obx(() =>
                      DropdownButton<String>(
                      hint: Text('Seleccionar motivo'),
                      value: _.motivo.value,
                      onChanged: (String? seleccionado){
                        _.motivo.value = seleccionado!;
                      },
                      items: _.listMotivo
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
                      _.aceptar();
                    }, 
                    child: Text('Aceptar')
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/tutorado-inicio');
                    }, 
                    child: Text('Cancelar')
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


