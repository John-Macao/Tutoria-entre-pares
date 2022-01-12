import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorCoordinacionController extends GetxController{
  



  //VARIABLES CON DATOS DE NUEVO ORARIO
  List<String> listDocente = <String>[];
  List<String> listAsignatura = <String>[];
  RxString docente = 'Vacio'.obs;
  RxString asignatura = ''.obs;
  var comentario = TextEditingController();
  
  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Tutor'){
      MsalService().getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    //Dias
    listDocente.add('Vacio');

    //asignaturas se agregan asi porque no hay db
    listAsignatura.add('Calculito');
    listAsignatura.add('Algebra Lineal');
    listAsignatura.add('Probabilidad');
    asignatura.value = listAsignatura[0];

    
  }

  consultar(){
    //realizar una busqueda de los docentes por los servicios web
    print(asignatura.value);
    listDocente = <String>[];
    listDocente.add('Profesor1');
    listDocente.add('Profesor2');
    listDocente.add('Profesor3');
    docente.value = listDocente[0];

  }
  
  guardar(){
    print(asignatura.value);
    print(docente.value);
    print(comentario.text);
  }



}