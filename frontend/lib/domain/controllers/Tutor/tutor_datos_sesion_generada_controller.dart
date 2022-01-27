import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorDatosSesionGeneradaController extends GetxController{

  int horarioId = 0;

  Horario horario = Horario(horId: 0, horDia: '', horHora: '', horFehca: null, horTipo: '', maofId:0, usuId:0);

  TutorDatosSesionGeneradaController(this.horarioId);

  String nombre = '';

  String asignatura = '';
  
  
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

  Future<void> loadDatos() async{
    //print('se busca con: ' + horarioId.toString());

    nombre = (await Usuario_api.instace.fetch_usuario_nombre(cor))!;

    horario = (await Horario_api.instace.fetch_horarios_id(horarioId))!;

    MateriaOferta mo = (await MateriaOferta_api.instace.fetch_materia__por_ip(horario.maofId))!;

    //buscar en la api de la u el nombre de la asignatura, por el momento se usa el id de la asingatura
    asignatura = mo.idMateriaApi.toString();

    //print('debuelve: ' + horario.horId.toString());

    update();
  }





  
}