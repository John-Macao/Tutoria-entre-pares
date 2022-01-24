import 'package:dio/dio.dart';
import 'package:frontend/domain/models/coordinacion.dart';

class Coordinacion_api {

  Coordinacion_api._internal();
  
  static Coordinacion_api _instance = Coordinacion_api._internal();
  static Coordinacion_api get instace => _instance;

  final _dio = Dio();

  Future<List<Coordinacion>?> fetch_coordinacion_tutor(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-coordinaicon-tutor/'+correo;
      final Response response = await _dio.get(llamada,);
      List<Coordinacion> listCoordinacion = (response.data as List).map((e) => Coordinacion.fromJson(e)).toList();
      return listCoordinacion;
    } catch (e) {
      return null;
    }
  }

  Future<Object> put_coordinacion(String correo, json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-coordinaicon/'+correo;
      final response = await _dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
    }
  }

}