import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_reporte_tutorias_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaReporteTutorias extends StatelessWidget {
  const VistaReporteTutorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("Reporte Tutorias"),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: reporteTutorias(),
        ),
      )
    );
  }
}

class reporteTutorias extends StatelessWidget {
  const reporteTutorias({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReporteTutoriasController>(
      init: ReporteTutoriasController(),
      builder: (_){
        return Container(
          child: Column(
             
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text("Filtro: "),
                        ),
                        InkWell(
                      child: DropdownButton(
                        hint: Text('Tipo de tutoria'),
                        value: _.opcion,
                        items: _.opciones.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (_) {
                        },
                      ),
                      
                          ),
                    InkWell(
                      child: Center(
                        child: Text("                 "),
                      ),
                  ),
                  InkWell(
                      child: Center(
                        child: Text("Desde:  "),
                      ),
                  ),
                  InkWell(
                      child: DropdownButton(
                        hint: Text('Tipo de tutoria'),
                        value: _.opcion,
                        items: _.desde.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (_) {
                        },
                      ),
                          ),
                    InkWell(
                      child: Center(
                        child: Text("Hasta:  "),
                      ),
                  ),
                  InkWell(
                      child: DropdownButton(
                        hint: Text('Tipo de tutoria'),
                        value: _.opcion,
                        items: _.hasta.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (_) {
                        },
                      ),
                          ),

                      ],
                      
                    ),
                  ),
                  InkWell(
                    child: TextButton(
                      style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.red,
                      textStyle: const TextStyle(fontSize: 30),
                  ),
                      
                      onPressed: (){
                      }, 
                      child: Text("Generar")),
                      
                      
                  ),
                  InkWell(
                      child: DropdownButton(
                        hint: Text('Tipo de Grafica : '),
                        value: _.opcion,
                        items: _.grafica.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                        onChanged: (_) {
                        },
                      ),
                          ),
                    
                ],

          ),
          

          
        );
        
      },
      
    );
  }
}

