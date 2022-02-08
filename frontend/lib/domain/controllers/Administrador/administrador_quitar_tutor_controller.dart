import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class QuitarTutorController extends GetxController{

  final UsuarioRepository _usuarioRepository;
  final MateriaOfertaRepository _materiaOfertaRepository;

  int idTutor = 0;
  String nombre = '';
  String correo = '';
  String carrera = '';
  String telefono = '';
  String nivel = '';
  var cedula = TextEditingController();
  List<String> listMaterias = [];
  
  QuitarTutorController(this._usuarioRepository, this._materiaOfertaRepository);
  
  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService(_usuarioRepository).getCorreo(); 
    var rol = await MsalService(_usuarioRepository).getRol(cor);
    if(rol!='Administrador'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  Future buscar()async{
    final tutor = await _usuarioRepository.fetch_usuario_por_cedula(cedula.text);
    nombre = tutor!.usuNomrbe;
    correo = tutor.usuCorreo;
    carrera = tutor.usuCarrera;
    telefono = tutor.usuTelefono;
    nivel = tutor.usuNivel.toString();
    idTutor = tutor.usuId;


    final listMaOf = (await _materiaOfertaRepository.fetch_materia_por_tutor(correo))!;
    for(int i=0;i<listMaOf.length;i++){
      //aqui se busca el nombre de las materias en la api de la u
      listMaterias.add(listMaOf[i].idMateriaApi.toString());
    }

    update();
  }
  

  Future eliminar(BuildContext context)async{
    final insertado = await _usuarioRepository.update_usuario_a_tutorado(idTutor);
    Navigator.pushNamed(context, "/administrador-principal");
  }

  
}