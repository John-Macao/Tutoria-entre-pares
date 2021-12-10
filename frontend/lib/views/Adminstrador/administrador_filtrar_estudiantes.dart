
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_filtro_estudiantes_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:get/get.dart';

class VistaFiltrarEstudiantes extends StatelessWidget {
  const VistaFiltrarEstudiantes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 0, 55, 114),
        title: Text("Filtrar Estudiantes"),
      ),
      drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: tablaFiltro(),
        ),
        
      )
    );
  }

}

class tablaFiltro extends StatelessWidget {
  const tablaFiltro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltroEstudiantesController>(
      init: FiltroEstudiantesController() ,
      builder: (_){
        return Container(
          child: Column(
            children: [
              InkWell(
                child: Row(
                  children: [
                    Text("Materia : "),
                  ],
                ),
              ),
              InkWell(
                child: TextField(
                    textInputAction: TextInputAction.newline,
                    maxLines: 1,
                    minLines: 1,
                  ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Text("Calificación : "),
                  ],
                ),
              ),
              InkWell(
                child: TextField(
                    textInputAction: TextInputAction.newline,
                    maxLines: 1,
                    minLines: 1,
                  ),
              ),
              InkWell(
                child: TextButton( style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.blue,
                      textStyle: const TextStyle(fontSize: 20),
                  ),   onPressed: (){ _.filtrar(); }, child: Text("Filtrar"))
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
          ),
        );

      },
    );
  }
}