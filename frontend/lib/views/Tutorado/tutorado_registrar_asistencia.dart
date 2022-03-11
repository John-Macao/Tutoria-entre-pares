import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_registrar_asistencia_controller.dart';
import 'package:frontend/domain/repository/asistencia_repository.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:get/get.dart';

class TutoradoRegistrarAsistencia extends StatelessWidget{
  final String codigo;
  TutoradoRegistrarAsistencia({Key? key, required this.codigo}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoRegistrarAsistenciaController>(
      init: TutoradoRegistrarAsistenciaController(int.parse(codigo), locator.get<UsuarioRepository>(), locator.get<HorarioRepository>(), locator.get<AsistenciaRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Registrar asistencia", style: TextStyle(fontSize: 23),)),
          ),
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

                  SizedBox(height: 20,),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tutor Par', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(width: 15,),
                      Text(_.tutorPar, style: TextStyle(fontSize: 20)),


                    ],
                  ),

                  SizedBox(height: 20,),

                  Text('#Horas:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Obx(() =>
                      DropdownButton<String>(
                      hint: Text('Seleccionar #horas'),
                      value: _.hora.value,
                      onChanged: (String? seleccionado){
                        _.hora.value = seleccionado!;
                      },
                      items: _.listHoras
                            .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text('Tema:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                  SizedBox(width: 200,
                    child: CupertinoTextField(
                      controller: _.tema,
                    ),
                  ),

                  SizedBox(height: 20,),
                  
                  Text('Docente:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  Obx(() =>
                      DropdownButton<String>(
                      hint: Text('Seleccionar docente'),
                      value: _.docente.value,
                      onChanged: (String? seleccionado){
                        _.docente.value = seleccionado!;
                      },
                      items: _.listDocente
                            .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: 50,),

                  if (_.motivoBool == false) ...[
                    Text('¿Quién le incentivo a asistir a las tutorías?:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Obx(() =>
                        DropdownButton<String>(
                        hint: Text('Seleccionar motivo'),
                        value: _.motivo.value,
                        onChanged: (String? seleccionado){
                          _.motivo.value = seleccionado!;
                        },
                        items: _.listMotivo
                              .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                            );
                        }).toList(),
                      ),
                    ),
                  ],

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(
                      child: const Text(
                        "Aceptar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.aceptar(context);

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

                    SizedBox(width: 10,),

                    ElevatedButton(
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/tutorado-inicio');

                      }, 
                      style: ElevatedButton.styleFrom(
                        primary : colorRojo,
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
                    ]
                  ),

                  SizedBox(height: 30,),


/*
                  TextButton(
                    onPressed: (){
                      _.aceptar(context);
                    }, 
                    child: Text('Aceptar')
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/tutorado-inicio');
                    }, 
                    child: Text('Cancelar')
                  ),

                  */

                  
                ],
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


