import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_generar_tutoria_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';


class TutorGenerarTutoria extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorGenerarTutoriaController>(
      init: TutorGenerarTutoriaController(),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Generar Horario de Tutoria'),
        ),
      drawer: MenuView.getDrawer(context),
      //drawer: TutorMenu.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TutorMenu(),
                Row(
                  children: [
                    Form(child: Column(
                      children: [
                        Text('Dia: '),
                        Obx(() =>
                            DropdownButton<String>(
                            hint: Text('Seleccionar dia'),
                            value: _.dia.value,
                            onChanged: (String? seleccionado){
                              _.dia.value = seleccionado!;
                            },
                            items: _.listDia
                                  .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                );
                            }).toList(),
                          ),
                        ),
                        
                        Text('Hora: '),
                        Obx(() =>
                            DropdownButton<String>(
                            hint: Text('Seleccionar dia'),
                            value: _.hora.value,
                            onChanged: (String? seleccionado){
                              _.hora.value = seleccionado!;
                            },
                            items: _.horarios
                                  .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                                );
                            }).toList(),
                          ),
                        ),
                        Text('Asignatura: '),
                        Obx(() =>
                            DropdownButton<String>(
                            hint: Text('Seleccionar dia'),
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
                            _.agregarHorario();
                          }, 
                          child: Text('Agregar horario')
                        ),

                        //upara seleccionar la materia
                      ],
                    )
                    ),
                    HorarioInicio(),
                  ],
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




class HorarioInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorGenerarTutoriaController>(
      builder: (_){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: 
                Text('Hora', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Lunes', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Martes', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Miércoles', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Jueves', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Viernes', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
            ], 
            rows: List<DataRow>.generate(
              _.horarios.length,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(_.horarios[index]),
                  ),
                  DataCell(
                    Text(_.mlunes[_.horarios[index]]!=null?_.mlunes[_.horarios[index]]:''),
                  ),
                  DataCell(
                    Text(_.mmartes[_.horarios[index]]!=null?_.mmartes[_.horarios[index]]:''),
                  ),
                  DataCell(
                    Text(_.mmiercoles[_.horarios[index]]!=null?_.mmiercoles[_.horarios[index]]:''),
                  ),
                  DataCell(
                    Text(_.mjueves[_.horarios[index]]!=null?_.mjueves[_.horarios[index]]:''),
                  ),
                  DataCell(
                    Text(_.mviernes[_.horarios[index]]!=null?_.mviernes[_.horarios[index]]:''),
                  ),
                ]
              )
            ),
          ),
        );
      }
    );
  }
}