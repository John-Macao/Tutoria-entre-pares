import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_ver_coordinacion_controller.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorVerCoordinacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorVerCoordinacionController>(
      init: TutorVerCoordinacionController(locator.get<CoordinacionRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Coordinacion Docente", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorAzul,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/tutor-coordinacion').then((p) => _.loadDatos());
        },
        child: Icon(IconData(int.parse('0xe047'), fontFamily: 'MaterialIcons')),
      ),
      //drawer: TutorMenu.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Card( 
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 350, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                shrinkWrap: true,
                itemCount: _.listCoordinacionMostrados.length,
                itemBuilder: (context, index){
                  final Coordinacion coordinacion = _.listCoordinacionMostrados[index];
                  final int coordinacionId = coordinacion.cooId;
                  return Column(
                    children: [ 
                  ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    title: Text('Asignatura: ' + coordinacion.cooAsignatura),
                    subtitle: Text('Fecha: ' + coordinacion.cooFehca + '\n' + 'Comentario: ' + coordinacion.cooComentario + '\n' + 'Docente: ' + coordinacion.cooDocente),
                    trailing: Column(
                      children: [
                        ElevatedButton(
                          child: const Text(
                            "Editar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, 'tutor-editar-coordinacion/$coordinacionId').then((p) => _.loadDatos());
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

                        SizedBox(height: 10,),

                        ElevatedButton(
                          child: const Text(
                            "Eliminar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            _.elininar(coordinacion);
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

                      ],
                    ),
                    ),
                    SizedBox(height: 20,),
                    ],
                  );
                  
                }
              ),
              if (_.cantidadCoordinacion == true) ...[
                IconButton(
                  onPressed: (){
                    _.agregar();
                  }, 
                  icon: Icon(IconData(int.parse('0xe047'), fontFamily: 'MaterialIcons')),
                ),
              ] 
              ],
            ),
          ),
        ),
        ),
      );
      }
    );
  }
}

