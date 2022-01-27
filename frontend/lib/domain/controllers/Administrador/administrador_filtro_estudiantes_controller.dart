import 'package:flutter/cupertino.dart';
import 'package:frontend/data/external_db/ejemplo_api.dart';
import 'package:frontend/data/external_db/ejemplo_modelo.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/estudiantes.dart';
import 'package:frontend/domain/models/usuario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class FiltroEstudiantesController extends GetxController {
  var inputCalificacion = TextEditingController();

  List<Ejemplo> datosEjemplo = <Ejemplo>[];
  RxList<Ejemplo> filtrado = <Ejemplo>[].obs;
  var seleccionado = '';

  List<Usuario> listUsuarios = <Usuario>[];

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

    loadDatos();

  
  }


  filtrar(String texto){
    filtrado.value = datosEjemplo.where(
      (e) => (e.descripcion.toLowerCase().contains(
        texto.toLowerCase(),
      )),
    ).toList();

    filtrado.value = filtrado.value.sublist(0,5);
    seleccionado = '';
  }

  Future<void> loadDatos()async{
    datosEjemplo = (await ConsumoApi.instace.fetch_datos())!;
  }
  
  seleccionar(valor){
    seleccionado = valor;
    update(['check']);
  }


  Future buscarEstudiantes()async{

    print('Se buscara con los siguientes parametros:');
    print('Materia:' + seleccionado);
    print('Calificacion: ' + inputCalificacion.text);
    //se necesitaria un nuevo esturiante para obtener su calificacion 
    listUsuarios.add(Usuario(usuId: 1, usuCorreo: 'correo1@correo.com', usuNomrbe: 'Nombre1 Apellido1', usuCedula: '0102030203', usuEstado: 'A', usuTelefono: '0996325412', usuBeca: 'No', usuNivel: 5, usuCarrera: 'Computacion', usuRazon: '', tuId: 0));
    listUsuarios.add(Usuario(usuId: 1, usuCorreo: 'correo2@correo.com', usuNomrbe: 'Nombre2 Apellido2', usuCedula: '0102045795', usuEstado: 'A', usuTelefono: '0996542465', usuBeca: 'No', usuNivel: 5, usuCarrera: 'Mecatronica', usuRazon: '', tuId: 0));
    listUsuarios.add(Usuario(usuId: 1, usuCorreo: 'correo3@correo.com', usuNomrbe: 'Nombre3 Apellido3', usuCedula: '0102020294', usuEstado: 'A', usuTelefono: '0994135904', usuBeca: 'No', usuNivel: 5, usuCarrera: 'Electronica', usuRazon: '', tuId: 0));

    update(['tabla']);
    

  }



}



  