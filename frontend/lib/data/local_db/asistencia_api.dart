import 'package:dio/dio.dart';
import 'package:frontend/domain/models/asistencia.dart';

class Asistencia_api {

  Asistencia_api._internal();
  
  static Asistencia_api _instance = Asistencia_api._internal();
  static Asistencia_api get instace => _instance;

  final _dio = Dio();


  Future<Object> put_asistencia(String correo, json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-asistencia-tutorado/'+correo;
      final response = await _dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
    }
  }

}