import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_generar_sesion_controller.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';


class TutorGenerarSesion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Generar Sisión Tutorial", style: TextStyle(fontSize: 23),)),
      ),
      
      drawer: MenuView.getDrawer(context),
      body: SingleChildScrollView(
        child: formularioGenerarSesion(),
      ),
    );
  }
}


class formularioGenerarSesion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorGenerarSesionController>(
      init: TutorGenerarSesionController(locator.get<UsuarioRepository>(), locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>()),
      builder: (_){
        return Center(
          child: Container(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    enabled: true,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(fontSize: 15),
                      labelText: "Tutor Par:"
                    ),
                    controller: _.nombre,
                  ),
                  SizedBox(height: 30.0,),

                  Text("Asignatura:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: colorAzul),),

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

                  SizedBox(height: 30,),

                  ElevatedButton(
                    child: const Text(
                      "Generar Sesion Tutorial",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  onPressed: (){
                    _.generarSesion(context);

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

                  SizedBox(height: 30,)


                ],
              ),

            ),
          ),
        );
        
        /*
        Form(
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
                  _.generarSesion(context);
                }, 
                child: Text('Generar sesion tutorial')
              ),
            ],
          )
        );
        */
      }
    );
  }
}