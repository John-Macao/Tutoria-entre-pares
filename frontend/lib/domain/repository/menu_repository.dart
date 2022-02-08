import 'package:frontend/data/local_db/menu_api.dart';
import 'package:frontend/domain/models/menu.dart';

class MenuRepository {
  final Menu_api _menuApi;

  MenuRepository(this._menuApi);

  Future<List<Menu>?> fetch_menu(String correo) async {
    return await _menuApi.fetch_menu(correo);
  }
  Future<List<Menu>?> fetch_menu_hijos(int menfkid) async {
    return await _menuApi.fetch_menu_hijos(menfkid);
  }
}