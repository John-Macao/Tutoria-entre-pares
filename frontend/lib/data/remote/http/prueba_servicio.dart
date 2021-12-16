
import 'package:dio/dio.dart' as dio;
import '../../../domain/models/modelo_prueba.dart';


class PruebaServicio {

  PruebaServicio._internal();

  static PruebaServicio _instance = PruebaServicio._internal();
  static PruebaServicio get instace => _instance;

  Future<List<Prueba>?> obtener() async {

    try {

      final dio.Response response = await dio.Dio().get('https://jsonplaceholder.typicode.com/posts', queryParameters: {"delay": 1});
      print("Estado de la peticion:  ${response.statusCode}");
      return (response.data as List).map((e) => Prueba.fromJson(e)).toList();

    } catch (e) {
      print(' ERROR EN TEST_API :   ${e}');
      return null;
    }
  }
  
}