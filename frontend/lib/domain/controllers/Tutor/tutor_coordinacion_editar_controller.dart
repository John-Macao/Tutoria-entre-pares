import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorCoordinacionEditarController extends GetxController{

  int coordinacionId;

  Coordinacion? coor;

  //VARIABLES CON DATOS DE NUEVO ORARIO
  List<String> listDocente = <String>[];
  List<String> listAsignatura = <String>[];
  RxString docente = 'Vacio'.obs;
  RxString asignatura = ''.obs;
  var comentario = TextEditingController();

  TutorCoordinacionEditarController(this.coordinacionId);

  var cor = '';
  var rol = '';
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService().getCorreo())!; 
    rol = (await MsalService().getRol(cor))!;
    if(rol!='Tutor'){
      MsalService().getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    //Dias
    listDocente.add('Vacio');

    loadDatos();

    
  }

  Future loadDatos()async{
    coor = (await Coordinacion_api.instace.fetch_coordinacion_por_id(coordinacionId))!;

    final listMatOferta = (await MateriaOferta_api.instace.fetch_materias_unicas())!;
    for(int i=0;i<listMatOferta.length;i++){
      //por cada id_mat_api que haya, buscar en la api el nombre de la materia
      listAsignatura.add(listMatOferta[i].idMateriaApi.toString());
    }
    asignatura.value = coor!.cooAsignatura;

    consultar();

    update();
  }

  consultar(){
    //realizar una busqueda de los docentes por la API
    listDocente = <String>[];
    listDocente.add('Profesor1');
    listDocente.add('Profesor2');
    listDocente.add('Profesor3');
    docente.value = coor!.cooDocente;

    comentario.text = coor!.cooComentario;

  }
  
  Future guardar(BuildContext context)async{
    DateTime now = DateTime.now();
    String fecha = now.day.toString() + '-' + now.month.toString() + '-' + now.year.toString();

    Coordinacion coordinacion = Coordinacion(cooId: coor!.cooId, cooAsignatura: asignatura.value, cooDocente: docente.value, cooComentario: comentario.text, cooFehca: coor!.cooFehca,usuId: coor!.usuId);


    var json = jsonEncode(coordinacion.toJson());

    final creacion = await Coordinacion_api.instace.update_coordinacion(json);


    Navigator.pop(context);

  }



}