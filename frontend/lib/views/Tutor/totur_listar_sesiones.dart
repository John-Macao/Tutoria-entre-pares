import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_listar_sesiones_controller.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorListarSesionesController>(
      init: TutorListarSesionesController(locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Listar Sesiones'),
            actions: [
              IconButton(
                onPressed: (){
                  _.loadDatos();
                }, 
                icon: Icon(IconData(int.parse('0xe514'), fontFamily: 'MaterialIcons')),
              ),
            ],
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
    );
  }
}


class ListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorListarSesionesController>(
      builder: (_){
        return Form(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.horariosMostrados.length,
                itemBuilder: (context, index){
                  final Horario horario = _.horariosMostrados[index];
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

              if (_.cantidaddHorarios == true) ...[
                IconButton(
                  onPressed: (){
                    _.agregar();
                  }, 
                  icon: Icon(IconData(int.parse('0xe047'), fontFamily: 'MaterialIcons')),
                ),
              ] 
              
            ],
          )
        );
      }
    );
  }
}