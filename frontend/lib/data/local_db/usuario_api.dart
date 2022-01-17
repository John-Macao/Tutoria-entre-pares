import 'package:dio/dio.dart';

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
      print(llamada);
      final Response response = await this._dio.get(llamada,);
      String nombre = response.data['usu_nombre'];
      return nombre;

    } catch (e) {
      return null;
    }
  }


}