import 'package:get/get.dart';

class TutorGenerarSesionController extends GetxController{
  
  String nombre ='';
  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;
  
  @override
  void onInit(){
    super.onInit();
    //con conexion a base de datos
    nombre = 'Pablo Esteban Loja Morocho';

    listAsignatura.add('Calculito');
    listAsignatura.add('Algebra Lineal');
    listAsignatura.add('Probabilidad');
    asignatura.value = listAsignatura[0];
  }

  generarSesion(){
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
  }
  
}