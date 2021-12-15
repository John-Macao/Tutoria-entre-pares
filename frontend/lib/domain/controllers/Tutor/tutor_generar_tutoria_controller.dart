import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/tutor_horario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorGenerarTutoriaController extends GetxController{
  
  List<String> horarios = <String>[];
  //porque aun no hay conexion con la base de datos
  List<TutorHorario> tutorias = <TutorHorario>[];

  Map mlunes = {};
  Map mmartes = {};
  Map mmiercoles = {};
  Map mjueves = {};
  Map mviernes = {};



  //VARIABLES CON DATOS DE NUEVO ORARIO
  List<String> listDia = <String>[];
  List<String> listAsignatura = <String>[];
  RxString dia = 'Lunes'.obs;
  RxString hora = '7:00'.obs;
  RxString asignatura = ''.obs;
  
  @override
  void onInit(){
    super.onInit();
    if(MsalService.rol!='tutor'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    //Horas
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

    //Dias
    listDia.add('Lunes');
    listDia.add('Martes');
    listDia.add('Miercoles');
    listDia.add('Jueves');
    listDia.add('viernes');

    //asignaturas se agregan asi porque no hay db
    listAsignatura.add('Calculito');
    listAsignatura.add('Algebra Lineal');
    listAsignatura.add('Probabilidad');
    asignatura.value = listAsignatura[0];


    //se agrega porque no hay datos
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

  agregarHorario(){
    print('se agrega xd');
    print(dia);
    print(asignatura);
  }

  



}