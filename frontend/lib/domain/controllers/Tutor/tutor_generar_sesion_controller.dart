import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/Tutor/tutor_datos_sesion_generada.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorGenerarSesionController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  final HorarioRepository _horarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;
  
  var nombre = TextEditingController();
  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;

  var cor = '';
  var rol = '';
  Map materias = {};

  TutorGenerarSesionController(this._usuarioRepository, this._horarioRepository, this._materiaOfertaRepository);
  
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

    loadDatos();
  }



  Future<void> loadDatos() async{
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 

    nombre.text = (await _usuarioRepository.fetch_usuario_nombre(cor))!;

    final data = await _materiaOfertaRepository.fetch_materia_por_tutor(cor);
    List<MateriaOferta> mat = data!;
    for(var i=0; i<mat.length; i++){
      //se busca el nombre de la materia en la api de la u para poder ponerlo en la List de asignaturas
      //la llave del mapa es el nombre de la asignatura y su valor devuelve el id de la materia_oferta
      materias[mat[i].idMateriaApi.toString()] = mat[i].maofId;//antes del igual cambiar por el nombre de la materia 
      listAsignatura.add(mat[i].idMateriaApi.toString());
    }
    asignatura.value = listAsignatura[0];
    update();
  }

  Future generarSesion(BuildContext context) async {
    
    //obtener el id de la materia, el id del correo no es encesario, solo enviar el correo y el backend se encarga
    //aqui se buscan todas las materias 
    DateTime now = new DateTime.now();
    String fecha = now.day.toString() + '-' + now.month.toString() + '-' + now.year.toString();
    String hora = now.hour.toString() + ':' + now.minute.toString();
    String dia = '';
    switch (now.weekday) {
      case 1:
        dia = 'Lunes';
        break;
      case 2:
        dia = 'Martes';
        break;
      case 3:
        dia = 'Miercoles';
        break;
      case 4:
        dia = 'Jueves';
        break;
      case 5:
        dia = 'Viernes';
        break;
      case 6:
        dia = 'Sabado';
        break;
      case 7:
        dia = 'Domingo';
        break;
      default:
    }

    Horario horario = Horario(horId: 0, horDia: dia, horHora: hora, horFehca: fecha, horTipo: 'Sesion', maofId:materias[asignatura.value.toString()], usuId:-1);

    var json = jsonEncode(horario.toJson());

    final insertar = await _horarioRepository.put_horario_tutor_sesion(cor, json);

    int horarioId = (await _horarioRepository.fetch_ultimo_horario_creado(cor))!;

    //Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new TutorDatosSesionGenerada(horarioId: horarioId.toString())));
    Navigator.pushReplacementNamed(context, 'tutor-datos-sesion-generado/$horarioId');

  }
  
}