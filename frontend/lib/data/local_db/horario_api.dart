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
      final Response response = await this._dio.get(llamada,);
      List<Horario> horarios = (response.data as List).map((e) => Horario.fromJson(e)).toList();
      return horarios;

    } catch (e) {
      return null;
    }
  }
}