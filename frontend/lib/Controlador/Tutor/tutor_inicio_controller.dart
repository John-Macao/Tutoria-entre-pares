import 'package:frontend/modelo/tutor_horario.dart';
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

    tutorias.add(TutorHorario(id: 1, dia: 'lunes', hora: '7:00', materia: 'Algebra Lineal'));
    tutorias.add(TutorHorario(id: 2, dia: 'lunes', hora: '8:00', materia: 'Algebra Lineal'));
    
    tutorias.add(TutorHorario(id: 3, dia: 'miercoles', hora: '13:00', materia: 'Calculito'));
    tutorias.add(TutorHorario(id: 4, dia: 'miercoles', hora: '14:00', materia: 'Calculito'));

    tutorias.add(TutorHorario(id: 5, dia: 'viernes', hora: '20:00', materia: 'Algebra Lineal'));
    tutorias.add(TutorHorario(id: 6, dia: 'viernes', hora: '21:00', materia: 'Algebra Lineal'));

    for (var i = 0; i < tutorias.length; i++) {
      switch(tutorias[i].dia){
        case 'lunes': {
          mlunes[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'martes': {
          mmartes[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'miercoles': {
          mmiercoles[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'jueves': {
          mjueves[tutorias[i].hora] = tutorias[i].materia;
        } break;
        case 'viernes': {
          mviernes[tutorias[i].hora] = tutorias[i].materia;
        } break;
      }
    }
  }

  



}