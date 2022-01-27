
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_filtro_estudiantes_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaFiltrarEstudiantes extends StatelessWidget {
  const VistaFiltrarEstudiantes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("Filtrar Estudiantes"),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: SingleChildScrollView(
        child:Center(
          child: Container(
            child: tablaFiltro(),
          ),
        )
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
              CupertinoTextField(
                onChanged: (texto){
                  _.filtrar(texto);
                },
              ),

              Obx(()=>
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _.filtrado.length,
                  itemBuilder: (context, index){
                    return GetBuilder<FiltroEstudiantesController>(
                      id: 'check',
                      builder: (_){
                        return ListTile(
                          title: Text(_.filtrado[index].descripcion),
                          subtitle: Text(_.filtrado[index].category),
                          leading: Radio<dynamic>(
                            value: _.filtrado[index].descripcion, 
                            groupValue: _.seleccionado, 
                            onChanged: (value){
                              _.seleccionar(value);
                            },
                            activeColor: Colors.green, 
                          ),
                        );
                      }
                      );
                    
                  }
                ),
              ),


              InkWell(
                child: Row(
                  children: [
                    Text("Calificación : "),
                  ],
                ),
              ),
              
              CupertinoTextField(
                controller: _.inputCalificacion,
              ),

              InkWell(
                child: TextButton( style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.blue,
                      textStyle: const TextStyle(fontSize: 20),
                  ),   onPressed: (){ _.buscarEstudiantes(); }, child: Text("Filtrar"))
              ),

              GetBuilder<FiltroEstudiantesController>(
                id: 'tabla',
                builder: (_){
                  return DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: 
                        Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Nivel', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Calificacion Promedio', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                      DataColumn(label: 
                        Text('Carrera', style: TextStyle(fontWeight: FontWeight.bold),)
                      ),
                    ], 
                    rows: List<DataRow>.generate(
                      _.listUsuarios.length,
                      (int index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(_.listUsuarios[index].usuCedula),
                          ),
                          DataCell(
                            Text(_.listUsuarios[index].usuNomrbe),
                          ),
                          DataCell(
                            Text(_.listUsuarios[index].usuTelefono),
                          ),
                          DataCell(
                            Text(_.seleccionado),
                          ),
                          DataCell(
                            Text(_.listUsuarios[index].usuNivel.toString()),
                          ),
                          DataCell(
                            Text('55'),
                          ),
                          DataCell(
                            Text(_.listUsuarios[index].usuCarrera),
                          ),
                        ]
                      )
                    ),
                  );
                }
              ),

            ],
          ),
        );

      },
    );
  }
}