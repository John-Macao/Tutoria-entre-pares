import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Tutor/tutor_modificar_tutoria_controller.dart';
import 'package:frontend/Vista/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorModificarTutoria extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTutoriaController>(
      init: TutorModificarTutoriaController(),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Tutor Par Inicio'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TutorMenu(),
                Row(
                  children: [
                    Form(child: Column(
                      children: [
                        if (_.seleccionado.id>=0) ...[
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
                              _.actualizarHorario();
                            }, 
                            child: Text('Actualizar horario')
                          ),
                          TextButton(
                            onPressed: (){
                              _.eliminarHorario();
                            }, 
                            child: Text('Eliminar horario')
                          ),
                        ] else ...[
                          Text('Dia: '),
                          Text('???'),
                          
                          Text('Hora: '),
                          Text('???'),
                          Text('Asignatura: '),
                          Text('???'),
                        ],
                          

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
    return GetBuilder<TutorModificarTutoriaController>(
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
                    Text(_.mlunes[_.horarios[index]]?.materia!=null?_.mlunes[_.horarios[index]]!.materia:''),
                    onTap: (){
                      if(_.mlunes[_.horarios[index]]!=null){
                        _.seleccionarHorario(_.mlunes[_.horarios[index]]!);
                      }else{
                        _.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mmartes[_.horarios[index]]?.materia!=null?_.mmartes[_.horarios[index]]!.materia:''),
                    onTap: (){
                      if(_.mmartes[_.horarios[index]]!=null){
                        _.seleccionarHorario(_.mmartes[_.horarios[index]]!);
                      }else{
                        _.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mmiercoles[_.horarios[index]]?.materia!=null?_.mmiercoles[_.horarios[index]]!.materia:''),
                    onTap: (){
                      if(_.mmiercoles[_.horarios[index]]!=null){
                        _.seleccionarHorario(_.mmiercoles[_.horarios[index]]!);
                      }else{
                        _.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mjueves[_.horarios[index]]?.materia!=null?_.mjueves[_.horarios[index]]!.materia:''),
                    onTap: (){
                      if(_.mjueves[_.horarios[index]]!=null){
                        _.seleccionarHorario(_.mjueves[_.horarios[index]]!);
                      }else{
                        _.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mviernes[_.horarios[index]]?.materia!=null?_.mviernes[_.horarios[index]]!.materia:''),
                    onTap: (){
                      if(_.mviernes[_.horarios[index]]!=null){
                        _.seleccionarHorario(_.mviernes[_.horarios[index]]!);
                      }else{
                        _.seleccionarVacio();
                      }
                    }
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