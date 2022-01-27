import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/data/external_db/ejemplo_modelo.dart';

class ConsumoApi {

  ConsumoApi._internal();
  
  static ConsumoApi _instance = ConsumoApi._internal();
  static ConsumoApi get instace => _instance;

  final _dio = Dio();

  Future<List<Ejemplo>?> fetch_datos() async {
    try {
      var llamada = 'https://api.publicapis.org/entries';
      final Response response = await _dio.get(llamada);
      
      List<Ejemplo> datos = (response.data['entries'] as List).map((e) => Ejemplo.fromJson(e)).toList();
      return datos;
    } catch (e) {
      return null;
    }
  }


}