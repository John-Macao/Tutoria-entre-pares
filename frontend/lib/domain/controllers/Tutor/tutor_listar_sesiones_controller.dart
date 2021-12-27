import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorListarSesionesController extends GetxController{
  
  
  List<String> listAsignaturaDisponible = <String>[];
  List<String> asignaturas = <String>[];
  List<String> fechas = <String>[];
  List<String> horas = <String>[];
  RxString asignatura = ''.obs;
  int seleccionado = -1;
  
  @override
  void onInit(){
    super.onInit();
    if(MsalService.rol!='Tutor'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    //con conexion a base de datos para obtener las sesiones y cambiar todas estas variables por un modelo
    asignaturas.add('Calculito');
    asignaturas.add('Algebra Lineal');
    fechas.add('01/12/2021');
    fechas.add('02/12/2021');
    horas.add('11:00');
    horas.add('15:00');
    listAsignaturaDisponible.add('Calculito');
    listAsignaturaDisponible.add('Algebra Lineal');
    listAsignaturaDisponible.add('Probabilidad');
    asignatura.value = listAsignaturaDisponible[0];
  }

  escoger(int index){
    asignatura.value = asignaturas[index];
    seleccionado = index;
    update();
  }

  modificarSesion(){
    print('Asignatura: ' + asignatura.value);
    print('Fecha: ');
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    print(now);
    print(date);
    print('anio: ' + now.year.toString());
    print('mes: ' + now.month.toString());
    print('dia: ' + now.day.toString());
    print('hora: ' + now.hour.toString());
    print('minuto: ' + now.minute.toString());


    seleccionado = -1;
    update();
  }
  
}