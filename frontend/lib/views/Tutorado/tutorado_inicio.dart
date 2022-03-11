import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_inicio_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutoradoInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoInicioController>(
      init: TutoradoInicioController(locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Inicio Tutorado", style: TextStyle(fontSize: 23),)),
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
                  Text('Ingrese el Código de una Sesion Tutorial:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  
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
                      Navigator.pushReplacementNamed(context, '/tutorado-registrar-asistencia/'+_.codigo.text);

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
}


