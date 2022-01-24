import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorVerCoordinacionController extends GetxController{

  List<Coordinacion> listCoordinacion = [];

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

    loadDatos();
  }

  Future loadDatos()async{
    print('bbbbbbb');
    listCoordinacion = (await Coordinacion_api.instace.fetch_coordinacion_tutor(cor))!;
    print(listCoordinacion.length);

    update();
  }

}