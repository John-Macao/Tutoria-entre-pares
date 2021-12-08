import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TutoradoRegistrarAsistenciaController extends GetxController{
  
  var tema = TextEditingController();

  List<String> listHoras = <String>[];
  RxString hora = ''.obs;

  List<String> listDocente = <String>[];
  RxString docente = ''.obs;

  List<String> listMotivo = <String>[];
  RxString motivo = ''.obs;

  String tutorPar = '';

  @override
  void onInit(){
    super.onInit();
    //con la url se obtiene la sesion y se buscan los datos de la misma
    tutorPar = 'Pablo Esteban Loja Morocho';

    listHoras.add('1');
    listHoras.add('2');
    listHoras.add('3');
    hora.value = listHoras[0];
    
    //realizar una busqueda en los servicios web mediante la asignatura
    listDocente.add('Docente1');
    listDocente.add('Docente2');
    listDocente.add('Docente3');
    docente.value = listDocente[0];
    
    listMotivo.add('Motivo1');
    listMotivo.add('Motivo2');
    listMotivo.add('Motivo3');
    motivo.value = listMotivo[0];

  }


  aceptar(){
    //uso estos datos para llegar una asistencia
  }


  
  
}