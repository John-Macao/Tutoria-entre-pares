import 'package:dio/dio.dart';
import 'package:frontend/domain/models/materia_oferta.dart';

class MateriaOferta_api {

  MateriaOferta_api._internal();

  static MateriaOferta_api _instance = MateriaOferta_api._internal();
  static MateriaOferta_api get instace => _instance;

  final _dio = Dio();

  Future<MateriaOferta?> fetch_materia__por_ip(int id) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-materia-por-id/'+id.toString();
      final Response response = await this._dio.get(llamada,);
      MateriaOferta materia = MateriaOferta.fromJson(response.data);
      return materia;

    } catch (e) {
      return null;
    }
  }
}