import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_datos_sesion_generada_controller.dart';
import 'package:get/get.dart';

class TutorDatosSesionGenerada extends StatelessWidget{
  final String horarioId;
  TutorDatosSesionGenerada({Key? key, required this.horarioId}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de Sesión'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: GetBuilder<TutorDatosSesionGeneradaController>(
            init: TutorDatosSesionGeneradaController(int.parse(horarioId)),
            builder: (_){
              return Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tutor par: '),
                    Text(_.nombre),
                    Text('Fecha: '),
                    Text(_.horario.horFehca.toString()),
                    Text('Hora: '),
                    Text(_.horario.horHora),
                    Text('Asignatura: '),
                    Text(_.asignatura),
                    Text('Sesión #: '),
                    Text(_.horario.horId.toString()),
                    Text('Enlace: '),
                    SelectableText('http://localhost:64790//tutorado-registrar-asistencia/'+_.horario.horId.toString()),

                    TextButton(
                      onPressed: (){
                        //Navigator.pushNamed(context, '/tutor-par-inicio');
                        Navigator.pop(context);
                      }, 
                      child: Text('Salir'),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

