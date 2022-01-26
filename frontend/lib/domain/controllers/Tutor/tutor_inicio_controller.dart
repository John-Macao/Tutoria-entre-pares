import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/tutor_horario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorInicioController extends GetxController{
  
  List<String> horas = <String>[];
  
  List<Horario> horarios = <Horario>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};

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
    
    cor = (await MsalService().getCorreo())!; 
    final data = await Horario_api.instace.fetch_horarios_fijo(cor);

    horarios = data!;

    for (var i = 0; i < horarios.length; i++) {
      final mat = await MateriaOferta_api.instace.fetch_materia__por_ip(horarios[i].maofId);
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