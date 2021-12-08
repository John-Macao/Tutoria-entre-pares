import 'package:frontend/domain/models/tutor_horario.dart';
import 'package:get/get.dart';

class TutorInicioController extends GetxController{
  
  List<String> horarios = <String>[];
  //porque aun no hay conexion con la base de datos
  List<TutorHorario> tutorias = <TutorHorario>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};
  
  @override
  void onInit(){
    super.onInit();
    horarios.add('7:00');
    horarios.add('8:00');
    horarios.add('9:00');
    horarios.add('10:00');
    horarios.add('11:00');
    horarios.add('12:00');
    horarios.add('13:00');
    horarios.add('14:00');
    horarios.add('15:00');
    horarios.add('16:00');
    horarios.add('17:00');
    horarios.add('18:00');
    horarios.add('19:00');
    horarios.add('20:00');
    horarios.add('21:00');

    tutorias.add(TutorHorario(id: 1, dia: 'Lunes', hora: '7:00', materia: 'Algebra Lineal'));
    tutorias.add(TutorHorario(id: 2, dia: 'Lunes', hora: '8:00', materia: 'Algebra Lineal'));
    
    tutorias.add(TutorHorario(id: 3, dia: 'Miercoles', hora: '13:00', materia: 'Calculito'));
    tutorias.add(TutorHorario(id: 4, dia: 'Miercoles', hora: '14:00', materia: 'Calculito'));

    tutorias.add(TutorHorario(id: 5, dia: 'Viernes', hora: '20:00', materia: 'Algebra Lineal'));
    tutorias.add(TutorHorario(id: 6, dia: 'Viernes', hora: '21:00', materia: 'Algebra Lineal'));

    for (var i = 0; i < tutorias.length; i++) {
      switch(tutorias[i].dia){
        case 'Lunes': {
          mlunes[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'Martes': {
          mmartes[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'Miercoles': {
          mmiercoles[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'Jueves': {
          mjueves[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'Viernes': {
          mviernes[tutorias[i].hora] = tutorias[i].materia;
        } break;
      }
    }
  }

  



}