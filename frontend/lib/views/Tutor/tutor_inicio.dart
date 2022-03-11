import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_inicio_controller.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Horario Inicio", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      body: SingleChildScrollView(
        child: HorarioInicio(),
          ),
        );
  }
}


class HorarioInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorInicioController>(
      init: TutorInicioController(locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Center(
          child: Container(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric( vertical: 20 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

              child: SingleChildScrollView(
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
                    _.horas.length,
                    (int index) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(_.horas[index]),
                        ),
                        DataCell(
                          Text(_.mlunes[_.horas[index]]!=null?_.mlunes[_.horas[index]]:''),
                        ),
                        DataCell(
                          Text(_.mmartes[_.horas[index]]!=null?_.mmartes[_.horas[index]]:''),
                        ),
                        DataCell(
                          Text(_.mmiercoles[_.horas[index]]!=null?_.mmiercoles[_.horas[index]]:''),
                        ),
                        DataCell(
                          Text(_.mjueves[_.horas[index]]!=null?_.mjueves[_.horas[index]]:''),
                        ),
                        DataCell(
                          Text(_.mviernes[_.horas[index]]!=null?_.mviernes[_.horas[index]]:''),
                        ),
                      ]
                    )
                  ),
                ),
              ),
            ),
          ),
        );
        
      }
    );
  }
}