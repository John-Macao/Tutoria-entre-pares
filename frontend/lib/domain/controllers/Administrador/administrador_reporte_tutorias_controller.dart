import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class ReporteTutoriasController extends GetxController {

  
  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Administrador'){
      MsalService().getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  var opcion ;
  List<String> opciones = ['Materia', 'Jornada'];
  List<String> desde = ['01/09/2020', '02/09/2020', '03/09/2020', '04/09/2020', '05/09/2020', '06/09/2020'];
  List<String> hasta = ['01/12/2021', '02/12/2021', '03/12/2021', '04/12/2021', '05/12/2021', '06/12/2021'];
  List<String> grafica = ['Pastel' , 'Barras'];


}