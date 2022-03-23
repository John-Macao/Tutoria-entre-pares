import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_coordinacion_editar_controller.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorEditarCoordinacion extends StatelessWidget{
  final String coordinacionId;
  TutorEditarCoordinacion({Key? key, required this.coordinacionId}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorCoordinacionEditarController>(
      init: TutorCoordinacionEditarController(int.parse(coordinacionId), locator.get<MateriaOfertaRepository>(), locator.get<CoordinacionRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Editar Coordinacion", style: TextStyle(fontSize: 23),)),
          ),
      //drawer: MenuView.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TutorMenu(),
                Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

                  child: Column(
                  children: [
                    Text('Materia:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    Obx(() =>
                        DropdownButton<String>(
                        hint: Text('Seleccionar dia'),
                        value: _.asignatura.value,
                        onChanged: (String? seleccionado){
                          _.asignatura.value = seleccionado!;
                          _.consultar();
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

                    SizedBox(height: 20,),
                    
                    Text('Docente: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
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

                    SizedBox(height: 20,),
                    
                    Text('Comentario: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),

                    SizedBox(
                      width: 600,
                      child: CupertinoTextField(
                        controller: _.comentario,
                      ),
                    ),

                    SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            "Guardar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            _.guardar(context);
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

                        SizedBox(width: 20,),

                        ElevatedButton(
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/tutor-ver-coordinacion');
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