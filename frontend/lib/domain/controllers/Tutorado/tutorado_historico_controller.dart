import 'package:get/get.dart';

class TutoradoHistoricoController extends GetxController{
  
  
  List<String> listAsignatura = <String>[];
  List<String> listFecha = <String>[];
  List<String> listHora = <String>[];
  List<String> listTema = <String>[];
  List<String> listTutorPar = <String>[];

  
  @override
  void onInit(){
    super.onInit();
    //con conexion a base de datos para obtener las sesiones y cambiar todas estas variables por un modelo
    listAsignatura.add('Algebra Lineal');
    listAsignatura.add('Algebra Lineal');
    listFecha.add('01/12/2021');
    listFecha.add('02/12/2021');
    listHora.add('11:00');
    listHora.add('15:00');
    listTema.add('Dudas suma y multiplicacion de matrices');
    listTema.add('Vectores');
    listTutorPar.add('Pablo Esteban Loja Morocho');
    listTutorPar.add('Pablo Esteban Loja Morocho');
  }


  
}