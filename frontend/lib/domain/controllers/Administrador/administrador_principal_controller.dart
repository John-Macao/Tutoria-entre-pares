

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/estudiantes.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:frontend/domain/models/usuario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class PrincipalController extends GetxController{

  List<String> materias = <String>[];

  List<String> listAsignaturas = <String>[];
  Map<dynamic, dynamic> mapAsignaturas = {};
  RxString asignatura = ''.obs;
  List<Usuario> listTutores = <Usuario>[];
  List<String> listLunes = <String>[];
  List<String> listMartes = <String>[];
  List<String> listMiercoles = <String>[];
  List<String> listJueves = <String>[];
  List<String> listViernes = <String>[];
  

  var cedula = TextEditingController();


  RxString opcion = ''.obs;
  List<String> opciones = [];
  
  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Administrador'){
      MsalService().getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    opciones.add('Cedula');
    opciones.add('Materia');
    opcion.value = opciones[0];

    loadDatos();

  }

  Future loadDatos()async{
    materias = <String>[];
    listTutores = (await Usuario_api.instace.fetch_usuario_tutores())!;
    for(int i=0;i<listTutores.length;i++){
      materias.add('');
      final List<MateriaOferta> mat = (await MateriaOferta_api.instace.fetch_materia_por_tutor(listTutores[i].usuCorreo))!;
      for(int j=0; j<mat.length;j++){
        //buscar el nombre de la materia mediante la api de la u
        materias[i] = materias[i] + mat[j].idMateriaApi.toString() + ', ';
      }
    }
    update();
  }

  Future cambioOpcion()async{
    if(opcion.value=='Materia'){
      listAsignaturas = [];
      final listMatOferta = (await MateriaOferta_api.instace.fetch_materias_unicas())!;
    
      for(int i=0;i<listMatOferta.length;i++){
        //por cada id_mat_api que haya, buscar en la api el nombre de la materia
        listAsignaturas.add(listMatOferta[i].idMateriaApi.toString());
        mapAsignaturas[listMatOferta[i].idMateriaApi.toString()] = listMatOferta[i].idMateriaApi;
      }
      asignatura.value = listAsignaturas[0];
    }

    update(['formulario']);
  }

  Future buscarPorCedula()async{
    listTutores = <Usuario>[];
    materias = [];
    final usu = (await Usuario_api.instace.fetch_usuario_por_cedula(cedula.text))!;
    listTutores.add(usu);
    final List<MateriaOferta> mat = (await MateriaOferta_api.instace.fetch_materia_por_tutor(listTutores[0].usuCorreo))!;
    materias.add('');
    for(int j=0; j<mat.length;j++){
      //buscar el nombre de la materia mediante la api de la u
      materias[0] = materias[0] + mat[j].idMateriaApi.toString() + ', ';
    }

    update(['tabla']);

  }

  Future buscarPorMateria()async{
    listTutores = <Usuario>[];
    listLunes = <String>[];
    listMartes = <String>[];
    listMiercoles = <String>[];
    listJueves = <String>[];
    listViernes = <String>[];

    var idMateria = mapAsignaturas[asignatura.value];

    final materiasOferta = (await MateriaOferta_api.instace.fetch_materias_por_materia(idMateria))!;

    for(int i=0; i<materiasOferta.length; i++){
      listTutores.add((await Usuario_api.instace.fetch_usuario_por_id(materiasOferta[i].usuId))!);


      final horarios = (await Horario_api.instace.fetch_horarios_fijo_de_materia_y_usuario(listTutores[i].usuId, materiasOferta[i].maofId))!;


      listLunes.add('');
      listMartes.add('');
      listMiercoles.add('');
      listJueves.add('');
      listViernes.add('');

      for(int j=0;j<horarios.length;j++){
        switch (horarios[j].horDia) {
          case 'Lunes':
            listLunes[i] = listLunes[i] + horarios[j].horHora + ' -';
            break;
          case 'Martes':
            listMartes[i] = listMartes[i] + horarios[j].horHora + ' -';
            break;
          case 'Miercoles':
            listMiercoles[i] = listMiercoles[i] + horarios[j].horHora + ' -';
            break;
          case 'Jueves':
            listJueves[i] = listJueves[i] + horarios[j].horHora + ' -';
            break;
          case 'Viernes':
            listViernes[i] = listViernes[i] + horarios[j].horHora + ' -';
            break;
          default:
            break;
        }
      }
    }


    update(['tabla']);
  }

}

