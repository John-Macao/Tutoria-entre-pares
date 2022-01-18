import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/asistencia_api.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/asistencia.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoRegistrarAsistenciaController extends GetxController{

  int codigo = 0;

  Horario? horario;

  TutoradoRegistrarAsistenciaController(this.codigo);
  
  var tema = TextEditingController();

  List<String> listHoras = <String>[];
  List<String> listDocente = <String>[];
  List<String> listMotivo = <String>[];

  RxString hora = ''.obs;
  RxString docente = ''.obs;
  RxString motivo = ''.obs;

  String tutorPar = '';

  bool motivoBool = false;


  var cor = '';
  var rol = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService().getCorreo())!; 
    rol = (await MsalService().getRol(cor))!;
    if(rol!='Tutorado'){
      MsalService().getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();

  }


  Future loadDatos()async{
    listHoras.add('1');
    listHoras.add('2');
    listHoras.add('3');
    hora.value = listHoras[0];
    
    //realizar una busqueda en los servicios web mediante la asignatura
    listDocente.add('Docente1');
    listDocente.add('Docente2');
    listDocente.add('Docente3');
    docente.value = listDocente[0];
    
    listMotivo.add('Motivo1');
    listMotivo.add('Motivo2');
    listMotivo.add('Motivo3');
    motivo.value = listMotivo[0];

    horario = (await Horario_api.instace.fetch_horarios_id(codigo))!;

    tutorPar = (await Usuario_api.instace.fetch_usuario_nombre_por_id(horario!.usuId))!;

    motivoBool = (await Usuario_api.instace.fetch_usuario_motivo(cor))!;


    update();
  }


  Future aceptar(BuildContext context)async{

    if(motivoBool==false){
      final ingreso1 = await Usuario_api.instace.update_usuario_razon(cor, motivo.value);
    }


    //crear un mapa para encontrar el id de un docente que se obtuvo desde la api
    Asistencia asistencia = Asistencia(asiId: 0, asiTema: tema.text, asiHoras: int.parse(hora.value),asiTipo: '',docidApi: 1,horId: codigo,usuId: 0);
    
    var json = jsonEncode(asistencia.toJson());

    final ingreso2 = await Asistencia_api.instace.put_asistencia(cor, json);

  }


  
  
}