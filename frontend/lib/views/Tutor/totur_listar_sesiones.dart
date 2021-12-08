import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_listar_sesiones_controller.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Sesiones'),
      ),
      drawer: TutorMenu.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              ListarSesiones(),
            ],
          ),
        ),
      ),
    );
  }
}


class ListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorListarSesionesController>(
      init: TutorListarSesionesController(),
      builder: (_){
        return Form(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.asignaturas.length,
                itemBuilder: (context, index){
                  final String asig = _.asignaturas[index];
                  final String hora = _.horas[index];
                  final String fecha = _.fechas[index];
                  if (_.seleccionado!=index) {
                      return ListTile(
                      title: Text('Asignatura: ' + asig),
                      subtitle: Text('Fecha: ' + fecha + '\n Hora: ' + hora),
                      trailing: TextButton(
                        onPressed: (){
                          _.escoger(index);
                        },
                        child: Text('Modificar'),
                      ),
                    );
                  }else{
                    return Obx(() =>
                      ListTile(
                        title: DropdownButton<String>(
                                hint: Text('Seleccionar asignatura'),
                                value: _.asignatura.value,
                                onChanged: (String? seleccionado){
                                  _.asignatura.value = seleccionado!;
                                },
                                items: _.listAsignaturaDisponible
                                      .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                        subtitle: Text('Fecha: ' + fecha + '\n Hora: ' + hora),
                        trailing: TextButton(
                        onPressed: (){
                            _.modificarSesion();
                          },
                          child: Text('Aceptar'),
                        ),
                      )
                    );
                  }
                  
                }
              ),
            ],
          )
        );
      }
    );
  }
}