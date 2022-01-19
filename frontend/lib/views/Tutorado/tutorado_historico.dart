import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_historico_controller.dart';
import 'package:frontend/domain/models/asistencia.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutoradoHistorico extends StatelessWidget{
  @override
  Widget build(BuildContext context){
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
                itemCount: _.listAsistencia.length,
                itemBuilder: (context, index){
                  final Asistencia asistencia = _.listAsistencia[index];
                  final String asignatura = _.listAsignatura[index];
                  final String nombreTutor = _.listTutorPar[index];
                  final Horario horario = _.listHorario[index];
                  return ListTile(
                    title: Text('Asignatura: ' + asignatura),
                    subtitle: Text('Tema: ' + asistencia.asiTema + '\n' + 'Fecha: ' + horario.horFehca.toString() + '\nHora: ' + horario.horHora),
                    trailing: Column(
                      children: [
                        Text('TUTOR PAR:'),
                        Text(nombreTutor),
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