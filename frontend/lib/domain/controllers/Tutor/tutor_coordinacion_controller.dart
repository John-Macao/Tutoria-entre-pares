import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_ver_coordinacion_controller.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorCoordinacionController extends GetxController{
  
  final MateriaOfertaRepository _materiaOfertaRepository;
  final CoordinacionRepository _coordinacionRepository;
  final UsuarioRepository _usuarioRepository;


  //VARIABLES CON DATOS DE NUEVO ORARIO
  List<String> listDocente = <String>[];
  List<String> listAsignatura = <String>[];
  RxString docente = 'Vacio'.obs;
  RxString asignatura = ''.obs;
  var comentario = TextEditingController();

  var cor = '';
  var rol = '';


  TutorCoordinacionController(this._materiaOfertaRepository, this._coordinacionRepository, this._usuarioRepository);
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    rol = (await MsalService(_usuarioRepository).getRol(cor))!;
    if(rol!='Tutor'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    //Dias
    listDocente.add('Vacio');

    loadDatos();

    
  }

  Future loadDatos()async{
    final listMatOferta = (await _materiaOfertaRepository.fetch_materias_unicas())!;
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
  
  Future guardar(BuildContext context)async{
    DateTime now = DateTime.now();
    String fecha = now.day.toString() + '-' + now.month.toString() + '-' + now.year.toString();

    Coordinacion coordinacion = Coordinacion(cooId: 0, cooAsignatura: asignatura.value, cooDocente: docente.value, cooComentario: comentario.text, cooFehca: fecha,usuId: 0);


    var json = jsonEncode(coordinacion.toJson());

    final creacion = await _coordinacionRepository.put_coordinacion(cor, json);


    Navigator.pushReplacementNamed(context, '/tutor-ver-coordinacion');

  }



}