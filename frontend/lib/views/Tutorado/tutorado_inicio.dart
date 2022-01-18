import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_inicio_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutoradoInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoInicioController>(
      init: TutoradoInicioController(),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Tutor Par Inicio'),
          ),
          drawer: MenuView.getDrawer(context),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('REGISTRAR ASISTENCIA'),
                  Text('Ingresse el codigo de una sesion tutorial:'),
                  CupertinoTextField(
                    controller: _.codigo,
                  ),
                  TextButton(
                    onPressed: (){
                      //creo que se agrega el codigo al link de aqui, algo asi para enviar a la siguiente pagina
                      Navigator.pushNamed(context, '/tutorado-registrar-asistencia/'+_.codigo.text);
                    }, 
                    child: Text('Siguiente')
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


