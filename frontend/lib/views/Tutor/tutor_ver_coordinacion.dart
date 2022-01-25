import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_ver_coordinacion_controller.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorVerCoordinacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorVerCoordinacionController>(
      init: TutorVerCoordinacionController(),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Coordinacion'),
        ),
      drawer: MenuView.getDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/tutor-coordinacion').then((p) => _.loadDatos());
        },
        child: Icon(IconData(int.parse('0xe047'), fontFamily: 'MaterialIcons')),
      ),
      //drawer: TutorMenu.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                shrinkWrap: true,
                itemCount: _.listCoordinacion.length,
                itemBuilder: (context, index){
                  final Coordinacion coordinacion = _.listCoordinacion[index];
                  final int coordinacionId = coordinacion.cooId;
                  return ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    title: Text('Asignatura: ' + coordinacion.cooAsignatura),
                    subtitle: Text('Fecha: ' + coordinacion.cooFehca + '\n' + 'Comentario: ' + coordinacion.cooComentario + '\n' + 'Docente: ' + coordinacion.cooDocente),
                    trailing: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'tutor-editar-coordinacion/$coordinacionId').then((p) => _.loadDatos());
                          }, 
                          child: Text('Editar')
                        ),
                        TextButton(
                          onPressed: (){
                            _.elininar(coordinacion);
                          }, 
                          child: Text('Eliminar')
                        ),
                      ],
                    ),
                  );
                }
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

