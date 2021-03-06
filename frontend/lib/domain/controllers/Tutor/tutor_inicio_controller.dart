import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/tutor_horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorInicioController extends GetxController{

  final HorarioRepository _horarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;
  final UsuarioRepository _usuarioRepository;
  
  List<String> horas = <String>[];
  
  List<Horario> horarios = <Horario>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};

  var cor = '';
  var rol = '';

  TutorInicioController(this._horarioRepository, this._materiaOfertaRepository, this._usuarioRepository);
  
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

  
  Future<void> loadHorarios() async{
    
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    final data = await _horarioRepository.fetch_horarios_fijo(cor);

    horarios = data!;

    for (var i = 0; i < horarios.length; i++) {
      final mat = await _materiaOfertaRepository.fetch_materia__por_ip(horarios[i].maofId);
      //aqui se debe buscar (con el id de la api dentro de la variable materia) el nombre de la materia dentro de las apis ofrecidas por la u
      switch(horarios[i].horDia){
        case 'Lunes': {
          mlunes[horarios[i].horHora] = mat?.idMateriaApi.toString();//modificar por el resultado de la busqueda por la api
        } break;
        case 'Martes': {
          mmartes[horarios[i].horHora] = mat?.idMateriaApi.toString();
        } break;
        case 'Miercoles': {
          mmiercoles[horarios[i].horHora] = mat?.idMateriaApi.toString();
        } break;
        case 'Jueves': {
          mjueves[horarios[i].horHora] = mat?.idMateriaApi.toString();
        } break;
        case 'Viernes': {
          mviernes[horarios[i].horHora] = mat?.idMateriaApi.toString();
        } break;
      }
      update();

    }

  }
}