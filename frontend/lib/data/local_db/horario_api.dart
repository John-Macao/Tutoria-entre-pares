import 'package:dio/dio.dart';
import 'package:frontend/domain/models/horario.dart';

class Horario_api {

  Horario_api._internal();

  static Horario_api _instance = Horario_api._internal();
  static Horario_api get instace => _instance;

  final _dio = Dio();

  Future<List<Horario>?> fetch_horarios_fijo(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-horario-fijo/'+correo;
      print(llamada);
      final Response response = await this._dio.get(llamada,);
      List<Horario> horarios = (response.data as List).map((e) => Horario.fromJson(e)).toList();
      return horarios;

    } catch (e) {
      return null;
    }
  }

  Future<Object> put_horario_tutor(String correo, json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-horario-tutor-fijo/'+correo;
      final response = await this._dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
    }
  }


  Future<Object> update_horario_tutor(json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/actualizar-horario-tutor-fijo/';
      final response = await _dio.put(llamada, data: json);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<Object> delete_horario_tutor(json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/eliminar-horario-tutor-fijo/';
      final response = await _dio.put(llamada, data: json);
      return response;
    } catch (e) {
      return false;
    }
  }

}