import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_listar_sesiones_controller.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Sesiones'),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: TutorMenu.getDrawer(context),
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
                itemCount: _.horarios.length,
                itemBuilder: (context, index){
                  final Horario horario = _.horarios[index];
                  if (_.seleccionado!=index) {
                      return ListTile(
                      title: Text('Asignatura: ' + _.obtenerNombreMateria(horario.maofId)),
                      subtitle: Text('Fecha: ' + horario.horFehca.toString() + '\n Hora: ' + horario.horHora),
                      trailing: TextButton(
                        onPressed: (){
                          _.modificar(index, horario.maofId);
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
                                items: _.listAsignatura
                                      .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                        subtitle: Text('Fecha: ' + horario.horFehca.toString() + '\n Hora: ' + horario.horHora),
                        trailing: TextButton(
                        onPressed: (){
                            _.modificarSesion(horario);
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