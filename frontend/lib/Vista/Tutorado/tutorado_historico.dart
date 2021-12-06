import 'package:flutter/material.dart';
import 'package:frontend/Controlador/Tutorado/tutorado_historico_controller.dart';
import 'package:get/get.dart';

class TutoradoHistorico extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Par Inicio'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListarSesiones(),
            ],
          ),
        ),
      ),
    );
  }
}


class ListarSesiones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoHistoricoController>(
      init: TutoradoHistoricoController(),
      builder: (_){
        return Form(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.listAsignatura.length,
                itemBuilder: (context, index){
                  final String asig = _.listAsignatura[index];
                  final String fecha = _.listFecha[index];
                  final String hora = _.listHora[index];
                  final String tema = _.listTema[index];
                  final String tutorPar = _.listTutorPar[index];
                  return ListTile(
                    title: Text('Asignatura: ' + asig),
                    subtitle: Text('Tema: ' + tema + '\n' + 'Fecha: ' + fecha + '\nHora: ' + hora),
                    trailing: Column(
                      children: [
                        Text('TUTOR PAR:'),
                        Text(tutorPar),
                      ],
                    ),
                  );
                }
              ),
            ],
          )
        );
      }
    );
  }
}