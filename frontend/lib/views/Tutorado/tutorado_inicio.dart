import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_inicio_controller.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutoradoInicio extends StatelessWidget{

  Timer? realTimeSolicitudes;
  
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoInicioController>(
      init: TutoradoInicioController(locator.get<UsuarioRepository>(), locator.get<HorarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Registro", style: TextStyle(fontSize: 23),)),
          ),
          drawer: MenuView.getDrawer(context),
          body: SingleChildScrollView(
            child: Center(
              child: Card( 
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

                child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 370),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25,),
                  Text('REGISTRAR ASISTENCIA', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: colorAzul),),
                  SizedBox(height: 180,),
                  Text('Ingrese el Código de una Sesión Tutorial:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  
                  SizedBox(width: 120,
                  child: CupertinoTextField(
                    controller: _.codigo,
                  ),
                  ),

                  SizedBox(height: 70,),

                  ElevatedButton(
                      child: const Text(
                        "Siguiente",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.verificaSesionCodigo(_.codigo.text).then(
                        (valor) {
                          if(valor! == true) {
                            Navigator.pushReplacementNamed(context, '/tutorado-registrar-asistencia/'+_.codigo.text);
                          } else {
                            mensajeErrorCodigo(context);
                          }
                        }
                      );
                      
                      /*
                      _.verificaSesionCodigo(_.codigo.text);
                      //realTimeSolicitudes = Timer(Duration(seconds: 10) , () => print('Timer finished'));
                      if (_.comprobar) {
                        CircularProgressIndicator();
                        print("entra mal ");
                        mensajeErrorCodigo(context);
                        
                      }else{
                        print("entra bien ");
                        Navigator.pushReplacementNamed(context, '/tutorado-registrar-asistencia/'+_.codigo.text);
                      
                      }
                      */
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

                    SizedBox(height: 50,),

                ],
              ),
            ),
          ),),),
        );
      }
    );
    
    
  }

    void mensajeErrorCodigo (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red),),
          content: const Text("Codigo de sesión incorrecto"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Aceptar", style: TextStyle(color: colorRojo)),
            ),
          ],
        );
      },
    );
  }

}


