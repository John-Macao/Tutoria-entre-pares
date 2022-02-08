import 'package:frontend/data/local_db/asistencia_api.dart';
import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/asistencia.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/asistencia_repository.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoHistoricoController extends GetxController{

  final AsistenciaRepository _asistenciaRepository;
  final HorarioRepository _horarioRepository;
  final UsuarioRepository _usuarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;
  
  List<Asistencia> listAsistencia = <Asistencia>[];
  List<Asistencia> listAsistenciaMostrados = <Asistencia>[];
  bool cantidadAsistencia = true;
  int cantidad = 20;


  List<String> listAsignatura = <String>[];
  List<String> listTutorPar = <String>[];
  List<Horario> listHorario = <Horario>[];


  var cor = '';
  var rol = '';  

  TutoradoHistoricoController(this._asistenciaRepository, this._horarioRepository, this._usuarioRepository, this._materiaOfertaRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    rol = (await MsalService(_usuarioRepository).getRol(cor))!;
    if(rol!='Tutorado'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();

  }

  Future loadDatos()async{
    listAsistencia = (await _asistenciaRepository.fetch_asistencias_tutorado(cor))!;

    for(int i=0; i<listAsistencia.length; i++){
      final horario = (await _horarioRepository.fetch_horarios_id(listAsistencia[i].horId))!;
      listHorario.add(horario);
      
      final nombre = (await _usuarioRepository.fetch_usuario_nombre_por_id(horario.usuId))!;
      listTutorPar.add(nombre);

      final materia = (await _materiaOfertaRepository.fetch_materia__por_ip(horario.maofId))!;
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