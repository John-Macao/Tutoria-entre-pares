import 'package:dio/dio.dart';
import 'package:frontend/domain/models/menu.dart';

class Menu_api {

  Menu_api._internal();

  static Menu_api _instance = Menu_api._internal();
  static Menu_api get instace => _instance;

  final _dio = Dio();

  Future<List<Menu>?> fetch_menu(String correo) async {
    try {
      var llamada = 'http://127.0.0.1:8000/menu/'+correo;
      final Response response = await this._dio.get(llamada,);
      List<Menu> menus = (response.data as List).map((e) => Menu.fromJson(e)).toList();
      return menus;

    } catch (e) {
      return null;
    }
  }
  Future<List<Menu>?> fetch_menu_hijos(int menfkid) async {
    try {
      var llamada = 'http://127.0.0.1:8000/menu-hijo/'+menfkid.toString();
      final Response response = await this._dio.get(llamada,);
      List<Menu> menus = (response.data as List).map((e) => Menu.fromJson(e)).toList();
      return menus;

    } catch (e) {
      return null;
    }
  }
}