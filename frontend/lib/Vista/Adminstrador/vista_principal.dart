
import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Administrador/inicio_controller.dart';
import 'package:frontend/Controlador/Administrador/menu_controller.dart';
import 'package:get/get.dart';

class VistaPrincipal extends StatelessWidget {
  const VistaPrincipal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administrador"),
      ),
      drawer: Menu.getDrawer(context),
      body: const HorarioPrincipal(),
    );
    
  }
}


class HorarioPrincipal extends StatelessWidget{
  const HorarioPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<AdministradorController>(
      init: AdministradorController(),
      builder: (_){
        return Column(
          children: [
            const InkWell(
              child: Text("Filtrar Cedula: "),
            ),
            const InkWell(
              child: TextField(
                  textInputAction: TextInputAction.newline,
                  maxLines: 1,
                  minLines: 1,
                ),
            ),
            const InkWell(
              child: Text("Filtrar Materia: "),
            ),
            const InkWell(
              child: TextField(
                  textInputAction: TextInputAction.newline,
                  maxLines: 1,
                  minLines: 1,
                ),
            ),
            InkWell(
              child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: 
              Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold), )
            ),
            DataColumn(label: 
              Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Calificación', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Carrera', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
          ],
          rows: _.estudiante.map<DataRow>((e) => DataRow(cells: [
            DataCell(Text(e.cedula)),
            DataCell(Text(e.nombres)),
            DataCell(Text(e.materia)),
            DataCell(Text(e.calificacion)),
            DataCell(Text(e.carrera)),
            
          ])).toList()
        ),


            ),

          ],
        );
      }
    );
  }
}