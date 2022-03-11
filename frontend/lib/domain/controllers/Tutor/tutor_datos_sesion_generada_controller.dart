import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorDatosSesionGeneradaController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  final HorarioRepository _horarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;

  int horarioId = 0;

  Horario horario = Horario(horId: 0, horDia: '', horHora: '', horFehca: null, horTipo: '', maofId:0, usuId:0);

  TutorDatosSesionGeneradaController(this.horarioId, this._usuarioRepository, this._horarioRepository, this._materiaOfertaRepository);

  var nombre = TextEditingController();

  var asignatura = TextEditingController();
  
  
  var cor = '';
  var rol = '';

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
    //print('se busca con: ' + horarioId.toString());

    nombre.text = (await _usuarioRepository.fetch_usuario_nombre(cor))!;

    horario = (await _horarioRepository.fetch_horarios_id(horarioId))!;

    MateriaOferta mo = (await _materiaOfertaRepository.fetch_materia__por_ip(horario.maofId))!;

    //buscar en la api de la u el nombre de la asignatura, por el momento se usa el id de la asingatura
    asignatura.text = mo.idMateriaApi.toString();

    //print('debuelve: ' + horario.horId.toString());

    update();
  }





  
}