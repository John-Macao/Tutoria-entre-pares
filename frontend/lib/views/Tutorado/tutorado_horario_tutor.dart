import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_horario_tutor_controller.dart';
import 'package:get/get.dart';

class TutoradoHorarioTutor extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Par Inicio'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AsignaturaDeTabla(),
              TablaTutorHorario(),
            ],
          ),
        ),
      ),
    );
  }
}


class AsignaturaDeTabla extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoHorarioTutorController>(
      init: TutoradoHorarioTutorController(),
      builder: (_){
        return Column(
          children: [
            Text('Matteria: '),
            Obx(() =>
                DropdownButton<String>(
                hint: Text('Seleccionar asignatura'),
                value: _.asignatura.value,
                onChanged: (String? seleccionado){
                  _.buscar(seleccionado!);
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
          ],
        );
      }
    );
  }
}


class TablaTutorHorario extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoHorarioTutorController>(
      init: TutoradoHorarioTutorController(),
      builder: (_){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: 
                Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Contacto', style: TextStyle(fontWeight: FontWeight.bold),)
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
              _.listTutores.length,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(_.listTutores[index]),
                  ),
                  DataCell(
                    Text(_.asignatura.value),
                  ),
                  DataCell(
                    Text(_.listContacto[index]),
                  ),
                  DataCell(
                    Text(_.listLunes[index]!=null?_.listLunes[index]:''),
                  ),
                  DataCell(
                    Text(_.listMartes[index]!=null?_.listMartes[index]:''),
                  ),
                  DataCell(
                    Text(_.listMiercoles[index]!=null?_.listMiercoles[index]:''),
                  ),
                  DataCell(
                    Text(_.listJueves[index]!=null?_.listJueves[index]:''),
                  ),
                  DataCell(
                    Text(_.listViernes[index]!=null?_.listViernes[index]:''),
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