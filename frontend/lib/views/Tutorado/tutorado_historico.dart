import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_historico_controller.dart';
import 'package:frontend/domain/models/asistencia.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/asistencia_repository.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutoradoHistorico extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Histórico", style: TextStyle(fontSize: 23),)),
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
      init: TutoradoHistoricoController(locator.get<AsistenciaRepository>(), locator.get<HorarioRepository>(), locator.get<UsuarioRepository>(), locator.get<MateriaOfertaRepository>()),
      builder: (_){
        return Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

          child: Container( 
            margin: EdgeInsets.symmetric(horizontal: 270),
          child: Column(
            children: [
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  child: const Text(
                    "Refrescar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                onPressed: (){
                  _.loadDatos();

                  }, 
                  style: ElevatedButton.styleFrom(
                    primary : colorAzulClaro,
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

              ),

              SizedBox(height: 20,),

              ListView.builder(
                shrinkWrap: true,
                itemCount: _.listAsistenciaMostrados.length,
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

              SizedBox(height: 20,),

              if (_.cantidadAsistencia == true) ...[
                IconButton(
                  onPressed: (){
                    _.agregar();
                  }, 
                  icon: Icon(IconData(int.parse('0xe047'), fontFamily: 'MaterialIcons')),
                ),
              ] 
            ],
          ),
          ),
        );
      }
    );
  }
}