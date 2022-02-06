import 'dart:convert';

import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:frontend/domain/models/tutor_horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorModificarTutoriaController extends GetxController{

  final HorarioRepository _horarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;
  final UsuarioRepository _usuarioRepository;

Horario seleccionado = Horario(horId:-1,horDia:'',horHora:'',horFehca: null,horTipo: '',maofId: -1,usuId: -1);
  
  List<String> horas = <String>[];
  
  List<Horario> horarios = <Horario>[];

  Map<dynamic, Horario> mlunes = {};
  Map<dynamic, Horario> mmartes = {};
  Map<dynamic, Horario> mmiercoles = {};
  Map<dynamic, Horario> mjueves = {};
  Map<dynamic, Horario> mviernes = {};
  Map materiaNombre = {};


  var cor = '';
  var rol = '';

  TutorModificarTutoriaController(this._horarioRepository, this._materiaOfertaRepository, this._usuarioRepository);
  
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
    //Horas
    horas.add('7:00');
    horas.add('8:00');
    horas.add('9:00');
    horas.add('10:00');
    horas.add('11:00');
    horas.add('12:00');
    horas.add('13:00');
    horas.add('14:00');
    horas.add('15:00');
    horas.add('16:00');
    horas.add('17:00');
    horas.add('18:00');
    horas.add('19:00');
    horas.add('20:00');
    horas.add('21:00');
  }

  @override
  void onReady() {
    super.onReady();
    this.loadHorarios();
  }


  actualizarHorario(){
    mlunes = {};
    mmartes = {};
    mmiercoles = {};
    mjueves = {};
    mviernes = {};
    this.loadHorarios();
  }

  Future<void> loadHorarios() async{
    
    final data = await _horarioRepository.fetch_horarios_fijo(MsalService.correo);

    horarios = data!;

    for (var i = 0; i < horarios.length; i++) {
      final mat = await _materiaOfertaRepository.fetch_materia__por_ip(horarios[i].maofId);
      //aqui se debe buscar (con el id de la api dentro de la variable materia) el nombre de la materia dentro de las apis ofrecidas por la u
      materiaNombre[horarios[i].horId] = mat?.idMateriaApi.toString();//aqui se pondria el nombre de la materia
      switch(horarios[i].horDia){
        case 'Lunes': {
          mlunes[horarios[i].horHora] = horarios[i];//modificar por el resultado de la busqueda por la api
        } break;
        case 'Martes': {
          mmartes[horarios[i].horHora] = horarios[i];
        } break;
        case 'Miercoles': {
          mmiercoles[horarios[i].horHora] = horarios[i];
        } break;
        case 'Jueves': {
          mjueves[horarios[i].horHora] = horarios[i];
        } break;
        case 'Viernes': {
          mviernes[horarios[i].horHora] = horarios[i];
        } break;
      }
    }
      update(['horario']);
  }

}


class ModificarHorario extends GetxController{

  final HorarioRepository _horarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;
  final UsuarioRepository _usuarioRepository;

  Horario seleccionado = Horario(horId:-1,horDia:'',horHora:'',horFehca: null,horTipo: '',maofId: -1,usuId: -1);
  
  //este es un mapeo donde se van a guardar los nombres de las materias junto con el id de la materia ofertada por el tutor, esto para ahorrar 
  //esfuerzo buscando una por una hasta saber que materia se quiere ingresar, puesto que la tabla mareria_oferta no tiene el nombre de la materia
  Map materias = {};

  //VARIABLES NECESARIAS PARA MANIPULAR UN HORARIO
  List<String> listDia = <String>[];
  List<String> listAsignatura = <String>[];
  String? dia;
  String? hora;
  RxString asignatura = ''.obs;

  var cor ='';

  ModificarHorario(this._horarioRepository, this._materiaOfertaRepository, this._usuarioRepository);

  @override
  void onInit(){
    super.onInit();

    //Dias
    listDia.add('Lunes');
    listDia.add('Martes');
    listDia.add('Miercoles');
    listDia.add('Jueves');
    listDia.add('Viernes');

    //asignaturas se agregan 
    this.loadAsignaturas();
  }


  Future<void> loadAsignaturas() async{
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
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

  Future agregarHorario() async{
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    //obtener el id de la materia, el id del correo no es encesario, solo enviar el correo y el backend se encarga
    //aqui se buscan todas las materias 
    Horario horario = Horario(horId: 0, horDia: dia!, horHora: hora!, horFehca: null, horTipo: 'Fijo', maofId:materias[asignatura.value.toString()], usuId:-1);

    var json = jsonEncode(horario.toJson());

    final insertar = await _horarioRepository.put_horario_tutor(cor, json);

    return insertar;
  }

  Future actualizarHorario(Horario hor) async {
    Horario horario = Horario(horId: hor.horId, horDia: dia!, horHora: hora!, horFehca: null, horTipo: 'Fijo', maofId:materias[asignatura.value.toString()], usuId:hor.usuId);

    var json = jsonEncode(horario.toJson());

    final insertar = await _horarioRepository.update_horario_tutor(json);

    return insertar;
    
  }

  Future eliminarHorario(Horario horario)async{
    var json = jsonEncode(horario.toJson());

    final insertar = await _horarioRepository.delete_horario_tutor(json);
    return insertar;
  }

}