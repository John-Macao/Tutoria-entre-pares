import 'package:flutter/material.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/usuario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

import 'package:url_launcher/url_launcher.dart';

class TutoradoHorarioTutorController extends GetxController{

  final MateriaOfertaRepository _materiaOfertaRepository;
  final UsuarioRepository _usuarioRepository;
  final HorarioRepository _horarioRepository;

  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;

  Map<dynamic, dynamic> asignaturasMap = {};

  List<Usuario> listUsuario = <Usuario>[];


  List<String> listLunes = <String>[];
  List<String> listMartes = <String>[];
  List<String> listMiercoles = <String>[];
  List<String> listJueves = <String>[];
  List<String> listViernes = <String>[];


  TutoradoHorarioTutorController(this._materiaOfertaRepository, this._usuarioRepository, this._horarioRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService(_usuarioRepository).getCorreo(); 
    var rol = await MsalService(_usuarioRepository).getRol(cor);
    if(rol!='Tutorado'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();

  }

  Future loadDatos()async{
    final listMatOferta = (await _materiaOfertaRepository.fetch_materias_unicas())!;
    
    for(int i=0;i<listMatOferta.length;i++){
      //por cada id_mat_api que haya, buscar en la api el nombre de la materia
      listAsignatura.add(listMatOferta[i].idMateriaApi.toString());
      asignaturasMap[listMatOferta[i].idMateriaApi.toString()] = listMatOferta[i].idMateriaApi;
    }
    asignatura.value = listAsignatura[0];

    buscar();
  }

  Future buscar()async{
    listUsuario = <Usuario>[];
    listLunes = <String>[];
    listMartes = <String>[];
    listMiercoles = <String>[];
    listJueves = <String>[];
    listViernes = <String>[];

    var idMateria = asignaturasMap[asignatura.value];

    final materiasOferta = (await _materiaOfertaRepository.fetch_materias_por_materia(idMateria))!;

    for(int i=0; i<materiasOferta.length; i++){
      listUsuario.add((await _usuarioRepository.fetch_usuario_por_id(materiasOferta[i].usuId))!);


      final horarios = (await _horarioRepository.fetch_horarios_fijo_de_materia_y_usuario(listUsuario[i].usuId, materiasOferta[i].maofId))!;


      listLunes.add('');
      listMartes.add('');
      listMiercoles.add('');
      listJueves.add('');
      listViernes.add('');

      for(int j=0;j<horarios.length;j++){
        switch (horarios[j].horDia) {
          case 'Lunes':
            listLunes[i] = listLunes[i] + horarios[j].horHora + ', ';
            break;
          case 'Martes':
            listMartes[i] = listMartes[i] + horarios[j].horHora + ', ';
            break;
          case 'Miercoles':
            listMiercoles[i] = listMiercoles[i] + horarios[j].horHora + ', ';
            break;
          case 'Jueves':
            listJueves[i] = listJueves[i] + horarios[j].horHora + ', ';
            break;
          case 'Viernes':
            listViernes[i] = listViernes[i] + horarios[j].horHora + ', ';
            break;
          default:
            break;
        }
      }


      update();

    }

  }

  
}

class TutoradoTutorMiDataTableSource extends DataTableSource{
  List<Usuario> listTutores;
  List<String> listLunes;
  List<String> listMartes;
  List<String> listMiercoles;
  List<String> listJueves;
  List<String> listViernes;
  String materia;
  TutoradoTutorMiDataTableSource(this.listTutores,this.listLunes,this.listMartes,this.listMiercoles,this.listJueves,this.listViernes, this.materia);
  @override
  DataRow? getRow(int index){
    if(index >= listTutores.length){
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(listTutores[index].usuNomrbe)),
        DataCell(
          Row(
            children: [
              Text(listTutores[index].usuTelefono),
              IconButton(
                onPressed: (){
                  launch('tel://'+listTutores[index].usuTelefono);
                }, 
                icon: Icon(IconData(int.parse('0xe126'), fontFamily: 'MaterialIcons'))
              ),
            ],
          ),
          
        ),
        DataCell(Text(materia)),
        DataCell(Text(listLunes[index])),
        DataCell(Text(listMartes[index])),
        DataCell(Text(listMiercoles[index])),
        DataCell(Text(listJueves[index])),
        DataCell(Text(listViernes[index])),
      ]
    );
  }
  @override
  int get selectedRowCount {
    return 0;
  }
  @override
  bool get isRowCountApproximate {
    return false;
  }
  @override
  int get rowCount {
    return listTutores.length;
  }
}