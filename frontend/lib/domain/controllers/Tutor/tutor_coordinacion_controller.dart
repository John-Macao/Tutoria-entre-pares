import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorCoordinacionController extends GetxController{
  



  //VARIABLES CON DATOS DE NUEVO ORARIO
  List<String> listDocente = <String>[];
  List<String> listAsignatura = <String>[];
  RxString docente = 'Vacio'.obs;
  RxString asignatura = ''.obs;
  var comentario = TextEditingController();

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
    final listMatOferta = (await MateriaOferta_api.instace.fetch_materias_unicas())!;
    for(int i=0;i<listMatOferta.length;i++){
      //por cada id_mat_api que haya, buscar en la api el nombre de la materia
      listAsignatura.add(listMatOferta[i].idMateriaApi.toString());
    }
    asignatura.value = listAsignatura[0];

    consultar();

    update();
  }

  consultar(){
    //realizar una busqueda de los docentes por la API
    listDocente = <String>[];
    listDocente.add('Profesor1');
    listDocente.add('Profesor2');
    listDocente.add('Profesor3');
    docente.value = listDocente[0];

  }
  
  Future guardar()async{
    DateTime now = DateTime.now();
    String fecha = now.day.toString() + '-' + now.month.toString() + '-' + now.year.toString();

    Coordinacion coordinacion = Coordinacion(cooId: 0, cooAsignatura: asignatura.value, cooDocente: docente.value, cooComentario: comentario.text, cooFehca: fecha,usuId: 0);

    var json = jsonEncode(coordinacion.toJson());

    final creacion = await Coordinacion_api.instace.put_coordinacion(cor, json);

  }



}