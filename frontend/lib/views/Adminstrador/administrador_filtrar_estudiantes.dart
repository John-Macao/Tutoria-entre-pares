
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_filtro_estudiantes_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class VistaFiltrarEstudiantes extends StatelessWidget {
  const VistaFiltrarEstudiantes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Filtrar Estudiantes", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: SingleChildScrollView(
            //child: tablaFiltro(),
            child: filtro(),
          ),
    );
  }
}

class filtro extends StatelessWidget {
  const filtro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltroEstudiantesController>(
      init: FiltroEstudiantesController(locator.get<UsuarioRepository>()) ,
      builder: (_){
        return Container(
          child: Center(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text("Materia:", style: TextStyle(fontSize: 20),),
                      
                      const SizedBox(
                        width: 10,
                      ),

                      SizedBox(
                        width: 160, height: 23,
                      child: CupertinoTextField(
                        onChanged: (texto){
                        _.filtrar(texto);
                        }
                        //controller: _.materia,
                        //onChanged: _.filtrar(_.materia.text),
                      ),
                      ),

                      const SizedBox(
                        width: 30,
                      ),

                      const Text("Calificación min:", style: TextStyle(fontSize: 20),),
                      
                      const SizedBox(
                        width: 10,
                      ),
                      
                      SizedBox(
                        width: 160, height: 23,
                      child: CupertinoTextField(
                        controller: _.inputCalificacion,
                      ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      ElevatedButton(
                        child: const Text(
                          "Filtrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      onPressed: (){
                        _.buscarEstudiantes();

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
                    ],
                  ),

                  Row(
                    children: [
                      const SizedBox(
                      width: 320,
                    ),

                  SizedBox(
                    width: 300,
                    child: Obx(()=>
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: _.filtrado.length,
                              itemBuilder: (context, index){
                                return GetBuilder<FiltroEstudiantesController>(
                                  id: 'check',
                                  builder: (_){
                                    return ListTile(
                                      title: Text(_.filtrado[index].descripcion),
                                      //subtitle: Text(_.filtrado[index].descripcion),
                                      leading: Radio<dynamic>(
                                        value: _.filtrado[index].descripcion, 
                                        groupValue: _.materia.text, 
                                        onChanged: (value){
                                          _.seleccionar(value);
                                        },
                                        activeColor: Color.fromARGB(255, 233, 233, 3), 
                                      ),
                                      
                                    );
                                  }
                                  );
                              }
                            ),
                          ),
                    ),
                    ],
                  ),

                      SizedBox( height: 25,),

                      GetBuilder<FiltroEstudiantesController>(
                        id: 'tabla',
                        builder: (_){
                          return PaginatedDataTable(
                            arrowHeadColor: colorAzul,
                            rowsPerPage: 9,
                            columns: const <DataColumn>[
                              DataColumn(label: 
                                Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold),)
                              ),
                              DataColumn(label: 
                                Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold),)
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
                            source: FiltrarMiDataTableSource(_.listUsuarios,'Algebra')
                          );
                        }
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




















class tablaFiltro extends StatelessWidget {
  const tablaFiltro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FiltroEstudiantesController>(
      init: FiltroEstudiantesController(locator.get<UsuarioRepository>()) ,
      builder: (_){
        return Container(
          child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
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
                          /* leading: Radio<dynamic>(
                            value: _.filtrado[index].descripcion, 
                            //groupValue: _.seleccionado, 
                            onChanged: (value){
                              _.seleccionar(value);
                            },
                            activeColor: Colors.green, 
                          ),
                          */
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
                  return PaginatedDataTable(
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
                    source: FiltrarMiDataTableSource(_.listUsuarios,'Algebra')
                  );
                }
              ),



            ],
          ),
          ),
        );

      },
    );
  }
}