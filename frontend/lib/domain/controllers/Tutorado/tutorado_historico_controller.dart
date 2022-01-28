import 'package:frontend/data/local_db/asistencia_api.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/asistencia.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoHistoricoController extends GetxController{
  
  List<Asistencia> listAsistencia = <Asistencia>[];
  List<Asistencia> listAsistenciaMostrados = <Asistencia>[];
  bool cantidadAsistencia = true;
  int cantidad = 20;


  List<String> listAsignatura = <String>[];
  List<String> listTutorPar = <String>[];
  List<Horario> listHorario = <Horario>[];


  var cor = '';
  var rol = '';  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService().getCorreo())!; 
    rol = (await MsalService().getRol(cor))!;
    if(rol!='Tutorado'){
      MsalService().getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();

  }

  Future loadDatos()async{
    listAsistencia = (await Asistencia_api.instace.fetch_asistencias_tutorado(cor))!;

    for(int i=0; i<listAsistencia.length; i++){
      final horario = (await Horario_api.instace.fetch_horarios_id(listAsistencia[i].horId))!;
      listHorario.add(horario);
      
      final nombre = (await Usuario_api.instace.fetch_usuario_nombre_por_id(horario.usuId))!;
      listTutorPar.add(nombre);

      final materia = (await MateriaOferta_api.instace.fetch_materia__por_ip(horario.maofId))!;
      //BUSCAR EL NOMBRE DE LA MATERIA POR LA API DE LA U
      listAsignatura.add(materia.idMateriaApi.toString());
      //--------------------------------------------------
    }

    if(listAsistencia.length>=cantidad){
      listAsistenciaMostrados = listAsistencia.sublist(0,cantidad);
    }else{
      listAsistenciaMostrados = listAsistencia;
      cantidadAsistencia = false;
    }

    update();
  }

  agregar(){
    cantidad = cantidad + 20;
    if(listAsistencia.length>=cantidad){
      listAsistenciaMostrados = listAsistencia.sublist(0,cantidad);
    }else{
      listAsistenciaMostrados = listAsistencia;
      cantidadAsistencia = false;
    }
    update();
  }


  
}