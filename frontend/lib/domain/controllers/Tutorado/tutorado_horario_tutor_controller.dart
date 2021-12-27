import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoHorarioTutorController extends GetxController{

  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;
  
  List<String> listTutores = <String>[];
  List<String> listContacto = <String>[];

  List<String> listLunes = <String>[];
  List<String> listMartes = <String>[];
  List<String> listMiercoles = <String>[];
  List<String> listJueves = <String>[];
  List<String> listViernes = <String>[];


  @override
  void onInit(){
    super.onInit();
    if(MsalService.rol!='Tutorado'){
      MsalService().getCurrentUser();
      if (MsalService.rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    
    listAsignatura.add('Calculito');
    listAsignatura.add('Algebra Lineal');
    listAsignatura.add('Probabilidad');
    asignatura.value = listAsignatura[0];

    listTutores.add('Tutor1');
    listTutores.add('Tutor2');
    listTutores.add('Tutor3');

    listContacto.add('0998742563');
    listContacto.add('0998453908');
    listContacto.add('0998586726');

    int hor = 9;
    for (var i = 0; i < listTutores.length; i++) {
      listLunes.add('');
      listMartes.add('');
      listMiercoles.add('');
      listJueves.add('');
      listViernes.add('');
      if (i % 2 == 0) {
        listLunes[i] = listLunes[i] + hor.toString() + ':00 - ';
        hor++;
        listLunes[i] = listLunes[i] + hor.toString() + ':00';
        hor++;
        
        listViernes[i] = listViernes[i] + hor.toString() + ':00 - ';
        hor++;
        listViernes[i] = listViernes[i] + hor.toString() + ':00';
        hor++;
      } else {
        listMartes[i] = listMartes[i] + hor.toString() + ':00 - ';
        hor++;
        listMartes[i] = listMartes[i] + hor.toString() + ':00';
        hor++;
        
        listJueves[i] = listJueves[i] + hor.toString() + ':00 - ';
        hor++;
        listJueves[i] = listJueves[i] + hor.toString() + ':00';
        hor++;
      }
    }

  }

  buscar(String seleccionado){
    asignatura.value = seleccionado;
    update();
  }

  
}