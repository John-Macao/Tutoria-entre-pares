import 'package:dio/dio.dart';
import 'package:frontend/domain/models/asistencia.dart';

class Asistencia_api {


  final _dio = Dio();

  Asistencia_api();


  Future<Object> put_asistencia(String correo, json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-asistencia-tutorado/'+correo;
      final response = await _dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
    }
  }
  
  Future<List<Asistencia>?> fetch_asistencias_tutorado(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-asistencia-tutorado/'+correo;
      final Response response = await _dio.get(llamada,);
      List<Asistencia> asistencias = (response.data as List).map((e) => Asistencia.fromJson(e)).toList();
      return asistencias;
    } catch (e) {
      return null;
    }
  }

}