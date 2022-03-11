
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/usuario.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class AgregarNuevoTutorController extends GetxController {

  final UsuarioRepository _usuarioRepository;

  Usuario? usuario;
  //String nombre ='';
  var nombre = TextEditingController();
  var correo = TextEditingController();
  var carrera = TextEditingController();
  var telefono = TextEditingController();
  var nivel = TextEditingController();
  var cedula = TextEditingController();

  bool _comprobar = false;
  bool get comprobar => _comprobar;

  AgregarNuevoTutorController(this._usuarioRepository);

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

  buscar(){
    //SE MANDA A BUSCAR AL ESTUDIANTE EN LA API DE LA U CON EL NUMERO DE CEDULA Y SE LO CONVIERTE EN USUARIO Y ESO DEBE OBTENER ESTE METODO
    usuario = Usuario(usuId: 0, usuCorreo: "jmacao@est.ups.edu.ec", usuNomrbe: "John Macao", usuCedula: cedula.text, usuEstado: 'A', usuTelefono: "0989449535", usuBeca: "No", 
                      usuNivel: 9, usuCarrera: "Computación", usuRazon: "", tuId: 2);

    nombre.text = usuario!.usuNomrbe;
    correo.text = usuario!.usuCorreo;
    carrera.text = usuario!.usuCarrera;
    telefono.text = usuario!.usuTelefono;
    nivel.text = usuario!.usuNivel.toString();

    this._comprobar = true;

    update();
  }

  Future agregar(BuildContext context)async{
    final existe = await _usuarioRepository.comprobar_usuario_por_correo(correo.text);


    if(existe==true){
      final comprobacion = (await _usuarioRepository.fetch_usuario_por_correo(correo.text))!;
      final usu = Usuario(usuId: comprobacion.usuId, usuCorreo: comprobacion.usuCorreo, usuNomrbe: comprobacion.usuNomrbe, usuCedula: comprobacion.usuCedula, usuEstado: 'A', 
                      usuTelefono: comprobacion.usuTelefono, usuBeca: usuario!.usuBeca, usuNivel: usuario!.usuNivel, usuCarrera: usuario!.usuCarrera, usuRazon: comprobacion.usuRazon, 
                      tuId: 2);
      
      var json = jsonEncode(usu.toJson());

      final insertar = await _usuarioRepository.update_usuario_a_tutor(json);


    }else{
      
      var json = jsonEncode(usuario!.toJson());

      final insertar = await _usuarioRepository.put_usuario(json);


    }
    Navigator.pushReplacementNamed(context, '/administrador-principal');

  }

}

