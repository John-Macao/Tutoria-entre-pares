import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_inicio_controller.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Par Inicio'),
      ),
      drawer: TutorMenu.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              HorarioInicio(),
            ],
          ),
        ),
      ),
    );
  }
}


class HorarioInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorInicioController>(
      init: TutorInicioController(),
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