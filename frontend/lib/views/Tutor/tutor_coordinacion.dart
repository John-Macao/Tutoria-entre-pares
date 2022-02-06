import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_coordinacion_controller.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorCoordinacion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorCoordinacionController>(
      init: TutorCoordinacionController(locator.get<MateriaOfertaRepository>(),locator.get<CoordinacionRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Coordinacion'),
        ),
      drawer: MenuView.getDrawer(context),
      //drawer: TutorMenu.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TutorMenu(),
                Form(child: Column(
                  children: [
                    Text('Materia: '),
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
                        _.guardar(context);
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

