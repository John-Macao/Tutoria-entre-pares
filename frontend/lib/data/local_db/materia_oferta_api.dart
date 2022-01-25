import 'package:dio/dio.dart';
import 'package:frontend/domain/models/materia_oferta.dart';

class MateriaOferta_api {

  MateriaOferta_api._internal();

  static MateriaOferta_api _instance = MateriaOferta_api._internal();
  static MateriaOferta_api get instace => _instance;

  final _dio = Dio();

  Future<List<MateriaOferta>?> fetch_materias_unicas() async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-materias-unicas/';
      final Response response = await this._dio.get(llamada,);
      List<MateriaOferta> materias = (response.data as List).map((e) => MateriaOferta.fromJson(e)).toList();
      return materias;

    } catch (e) {
      return null;
    }
  }

  Future<List<MateriaOferta>?> fetch_materias_por_materia(int idMateriaApi) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-materias-por_materia/'+idMateriaApi.toString();
      final Response response = await this._dio.get(llamada,);
      List<MateriaOferta> materias = (response.data as List).map((e) => MateriaOferta.fromJson(e)).toList();
      return materias;

    } catch (e) {
      return null;
    }
  }


  

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

 Future<List<MateriaOferta>?> fetch_materia_por_tutor(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/obtener-materias/'+correo;
      final Response response = await this._dio.get(llamada,);
      List<MateriaOferta> materias = (response.data as List).map((e) => MateriaOferta.fromJson(e)).toList();
      return materias;

    } catch (e) {
      return <MateriaOferta>[];
    }
  }

  Future<Object> update_deshabilitar_materia(correoTutor, idMateria) async{
    try {
      var llamada = 'http://127.0.0.1:8000/deshabilitar-materia-tutor/'+correoTutor+"-"+idMateria.toString();
      final response = await _dio.put(llamada);
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<Object> put_materia_oferta(correoTutor, idMateriaApi) async{
    try {
      var llamada = 'http://127.0.0.1:8000/agregar-materia-tutor/'+correoTutor+"-"+idMateriaApi.toString();
      final response = await _dio.put(llamada);
      return response;
    } catch (e) {
      return false;
    }
  }


  


  
}