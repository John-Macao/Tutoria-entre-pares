import 'package:dio/dio.dart';
import 'package:frontend/domain/models/usuario.dart';

class Usuario_api {

  Usuario_api._internal();

  static Usuario_api _instance = Usuario_api._internal();
  static Usuario_api get instace => _instance;

  final _dio = Dio();

  Future<String?> fetch_usuario_rol(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/usuario_rol/'+correo;
      final Response response = await this._dio.get(llamada,);
      String rol = response.data['tu_descripcion'];
      return rol;

    } catch (e) {
      return null;
    }
  }

  Future<String?> fetch_usuario_nombre(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/usuario_nombre/'+correo;
      final Response response = await _dio.get(llamada,);
      String nombre = response.data['usu_nombre'];
      return nombre;

    } catch (e) {
      return null;
    }
  }

  Future<String?> fetch_usuario_nombre_por_id(int usuId) async {
    try {
      var llamada = 'http://127.0.0.1:8000/usuario_por_id/'+usuId.toString();
      final Response response = await _dio.get(llamada,);
      String nombre = response.data['usu_nombre'];
      return nombre;

    } catch (e) {
      return null;
    }
  }

  Future<bool?> fetch_usuario_motivo(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/usuarios/'+correo;
      final Response response = await _dio.get(llamada,);
      String motivo = response.data['usu_razon'];
      if(motivo!=''){
        return true;
      }else{
        return false;
      }

    } catch (e) {
      return false;
    }
  }

  Future<String?> fetch_usuario_telefono(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/usuario_telefono/'+correo;
      final Response response = await _dio.get(llamada,);
      String telefono = response.data['usu_telefono'];
      return telefono;

    } catch (e) {
      return null;
    }
  }

  Future<Object> update_usuario_telefono(String correo, String telefono) async{
    try {
      var llamada = 'http://127.0.0.1:8000/actualizar-usuario-telefono/'+correo+'-'+telefono;
      final response = await _dio.put(llamada,);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<Object> update_usuario_razon(String correo, String razon) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuario-agregar-razon/'+correo+'-'+razon;
      final response = await _dio.put(llamada,);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<Object> comprobar_usuario_por_correo(String correo) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuarios/'+correo;
      final Response response = await _dio.get(llamada,);
      final Usuario usuario = Usuario.fromJson(response.data);
      print('aaaaaaaaaaa');
      print(usuario.tuId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Usuario?> fetch_usuario_por_correo(String correo) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuarios/'+correo;
      final Response response = await _dio.get(llamada,);
      final Usuario usuario = Usuario.fromJson(response.data);
      return usuario;
    } catch (e) {
      return null;
    }
  }

  Future<Object> update_usuario_a_tutor(json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuario-actualizar-a-tutor/';
      final response = await _dio.put(llamada, data: json);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<Object> put_usuario(json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuario-agregar/';
      final response = await this._dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
    }
  }

  Future<Usuario?> fetch_usuario_por_cedula(String cedula) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuario_por_cedula/'+cedula;
      final Response response = await _dio.get(llamada,);
      final Usuario usuario = Usuario.fromJson(response.data);
      return usuario;
    } catch (e) {
      return null;
    }
  }

  Future<Object> update_usuario_a_tutorado(id) async{
    try {
      var llamada = 'http://127.0.0.1:8000/usuario-actualizar-a-tutorado/'+id.toString();
      final response = await _dio.put(llamada);
      return response;
    } catch (e) {
      return false;
    }
  }
  


}