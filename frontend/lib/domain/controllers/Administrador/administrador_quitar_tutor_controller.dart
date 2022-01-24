import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class QuitarTutorController extends GetxController{
  int idTutor = 0;
  String nombre = '';
  String correo = '';
  String carrera = '';
  String telefono = '';
  String nivel = '';
  var cedula = TextEditingController();
  List<String> listMaterias = [];
  
  
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

  Future buscar()async{
    final tutor = await Usuario_api.instace.fetch_usuario_por_cedula(cedula.text);
    nombre = tutor!.usuNomrbe;
    correo = tutor.usuCorreo;
    carrera = tutor.usuCarrera;
    telefono = tutor.usuTelefono;
    nivel = tutor.usuNivel.toString();
    idTutor = tutor.usuId;


    final listMaOf = (await MateriaOferta_api.instace.fetch_materia_por_tutor(correo))!;
    for(int i=0;i<listMaOf.length;i++){
      //aqui se busca el nombre de las materias en la api de la u
      listMaterias.add(listMaOf[i].idMateriaApi.toString());
    }

    update();
  }
  

  Future eliminar(BuildContext context)async{
    final insertado = await Usuario_api.instace.update_usuario_a_tutorado(idTutor);
    Navigator.pushNamed(context, "/administrador-principal");
  }

  
}