import 'package:dio/dio.dart';
import 'package:frontend/domain/models/horario.dart';

class Horario_api {

  Horario_api();

  final _dio = Dio();

  Future<List<Horario>?> fetch_horarios_fijo(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-horario-fijo/'+correo;
      final Response response = await this._dio.get(llamada,);
      List<Horario> horarios = (response.data as List).map((e) => Horario.fromJson(e)).toList();
      return horarios;

    } catch (e) {
      return null;
    }
  }

  Future<List<Horario>?> fetch_horarios_fijo_de_materia_y_usuario(int usuId, int maofId) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-horario-fijo-de-materia_y_usuario/'+usuId.toString()+'-'+maofId.toString();
      final Response response = await this._dio.get(llamada,);
      List<Horario> horarios = (response.data as List).map((e) => Horario.fromJson(e)).toList();
      return horarios;

    } catch (e) {
      return <Horario>[];
    }
  }




  Future<List<Horario>?> fetch_horarios_sesion(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-horario-sesion/'+correo;
      final Response response = await _dio.get(llamada,);
      List<Horario> horarios = (response.data as List).map((e) => Horario.fromJson(e)).toList();
      return horarios;

    } catch (e) {
      return null;
    }
  }

  Future<Horario?> fetch_horarios_id(int horId) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-un-horario/'+horId.toString();
      final Response response = await _dio.get(llamada,);
      Horario horario = Horario.fromJson(response.data);
      return horario;

    } catch (e) {
      return null;
    }
  }
  

  Future<int?> fetch_ultimo_horario_creado(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-ultimo-horario/'+correo;
      final Response response = await this._dio.get(llamada,);
      int horarioId = response.data['hor_id'];
      return horarioId;

    } catch (e) {
      return null;
    }
  }

  Future<Object> put_horario_tutor_sesion(String correo, json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-horario-tutor-sesion/'+correo;
      final response = await _dio.put(llamada,data: json);
      return response;

    } catch (e) {
      return false;
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
  
  Future<Object> update_horario_tutor_sesion(json) async{
    try {
      var llamada = 'http://127.0.0.1:8000/actualizar-horario-tutor-sesion/';
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