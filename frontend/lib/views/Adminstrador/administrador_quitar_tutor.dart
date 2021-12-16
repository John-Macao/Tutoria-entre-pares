
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_quitar_tutor_controller.dart';
import 'package:frontend/util/paginacion.dart';
import 'package:frontend/util/responsive.dart';
import 'package:get/get.dart';
import 'package:frontend/util/style.dart' as style;

class VistaQuitarTutor extends StatelessWidget {
  const VistaQuitarTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quitar Tutor Par"),
      ),
      drawer: Menu.getDrawer(context),

      body: const SingleChildScrollView(
        child: formularioQuitarTutor(),
      )
    );
  }
}

class formularioQuitarTutor extends StatelessWidget {
  const formularioQuitarTutor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveApp responsiveP = ResponsiveApp(context);
    return GetBuilder<QuitarTutorController>(
      //id: 'usersTest',
      init: QuitarTutorController(),
      builder: (_){
        if(_.loadingTest){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: responsiveP.sizeBox1H,
                width: responsiveP.sizeBox1W,
                child: Center(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cédula: ", style: TextStyle(fontSize: responsiveP.text)),
                     Padding( padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxWidth,
                      height: responsiveP.boxHeight,
                      child: CupertinoTextField(
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                    Padding(padding: responsiveP.padding1Hrz),
                    MaterialButton(
                      shape: RoundedRectangleBorder( borderRadius: responsiveP.border1C),
                      color: style.colorBotones,
                      child: Text("Buscar", style: TextStyle(fontSize: responsiveP.buttonSize)),
                      onPressed: (){}
                    ),
                  ],
                  ),
                  
                ),
              ),
              SizedBox(
                height: responsiveP.sizeBox2H,
                width: responsiveP.sizeBox2W,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Nombres:  ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField( 
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                    Padding(padding: responsiveP.padding2Hrz),
                    Text("Correo:   ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField(  
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                  ],
                  ),
                  
                ),
              ),
              SizedBox(
                height: responsiveP.sizeBox2H,
                width: responsiveP.sizeBox2W,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Apellido:  ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField( 
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                    Padding(padding: responsiveP.padding2Hrz),
                    Text("Carrera:  ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField(  
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                  ],
                  ),
                  
                ),
              ),
              SizedBox(
                height: responsiveP.sizeBox2H,
                width: responsiveP.sizeBox2W,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Teléfono:  ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField( 
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                    Padding(padding: responsiveP.padding2Hrz),
                    Text("Nivel:    ", style: TextStyle(fontSize: responsiveP.text)),
                    Padding(padding: responsiveP.padding1Hrz),
                    SizedBox(
                      width: responsiveP.boxLabelW,
                      height: responsiveP.boxLabelH,
                      child: CupertinoTextField(  
                        enabled: false,
                        style: TextStyle(fontSize: responsiveP.textField),
                        controller: _.cedula,
                      ),
                    ),
                  ],
                  ),
                ),
              ),
              SizedBox(
                height: responsiveP.sizeBox3H,
                width: responsiveP.sizeBox3W,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder( borderRadius: responsiveP.border1C),
                      color: style.colorBotones,
                      child: Text("Agregar ", style: TextStyle(fontSize: responsiveP.buttonSize)),
                      onPressed: (){}
                    ),
                    Padding(padding: responsiveP.padding3Hrz),
                    MaterialButton(
                      shape: RoundedRectangleBorder( borderRadius: responsiveP.border1C),
                      color: style.colorBotones,
                      child: Text("Cancelar ", style: TextStyle(fontSize: responsiveP.buttonSize)),
                      onPressed: (){}
                    ),
                   ]
                  ),
                ),
              ),
              SizedBox(
                height: responsiveP.sizeBox4H,
                width: responsiveP.sizeBox4W,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Materias:    ", style: TextStyle(fontSize: responsiveP.text)),
                      PaginatedDataTable(
                        header: Text("Prueba --- "),
                        rowsPerPage: 2,
                        source: DataSource(_.test),
                        columns: [
                          DataColumn(label: Text('User ID'), numeric: false),
                          DataColumn(label: Text('Titulo'), numeric: false),
                          DataColumn(label: Text('Cuerpo'), numeric: false),
                          ], 
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      
    );
  }
}