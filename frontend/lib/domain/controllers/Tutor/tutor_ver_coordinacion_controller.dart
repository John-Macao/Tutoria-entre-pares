import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/coordinacion.dart';
import 'package:frontend/domain/repository/coodrinacion_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorVerCoordinacionController extends GetxController{

  final CoordinacionRepository _coordinacionRepository;
  final UsuarioRepository _usuarioRepository;

  List<Coordinacion> listCoordinacion = [];
  List<Coordinacion> listCoordinacionMostrados = <Coordinacion>[];
  bool cantidadCoordinacion = true;
  int cantidad = 20;

  var cor = '';
  var rol = '';

  TutorVerCoordinacionController(this._coordinacionRepository, this._usuarioRepository);
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService(_usuarioRepository).getCorreo())!; 
    rol = (await MsalService(_usuarioRepository).getRol(cor))!;
    if(rol!='Tutor'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();
  }

  Future loadDatos()async{
    listCoordinacion = (await _coordinacionRepository.fetch_coordinacion_tutor(cor))!;

    if(listCoordinacion.length>=cantidad){
      listCoordinacionMostrados = listCoordinacion.sublist(0,cantidad);
    }else{
      listCoordinacionMostrados = listCoordinacion;
      cantidadCoordinacion = false;
    }

    update();
  }


  Future elininar(Coordinacion coordinacion)async{
    var json = coordinacion.toJson();

    final insertar = await _coordinacionRepository.delete_coordinacion(json);

    loadDatos();

  }

  agregar(){
    cantidad = cantidad + 20;
    if(listCoordinacion.length>=cantidad){
      listCoordinacionMostrados = listCoordinacion.sublist(0,cantidad);
    }else{
      listCoordinacionMostrados = listCoordinacion;
      cantidadCoordinacion = false;
    }
    update();
  }

}