import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_listar_sesiones_controller.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
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
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Listar Sesiones", style: TextStyle(fontSize: 23),)),
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
        return Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 350, vertical: 70 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

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
                      trailing: ElevatedButton(
                        child: const Text(
                          "Modificar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      onPressed: (){
                        _.modificar(index, horario.maofId);

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
                        trailing: ElevatedButton(
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        onPressed: (){
                          _.modificarSesion(horario);

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