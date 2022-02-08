import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/models/usuario.dart';

class UsuarioRepository {
  final Usuario_api _usuarioApi;

  UsuarioRepository(this._usuarioApi);

  Future<Usuario?> fetch_usuario_por_id(int usuId) async {
    return await _usuarioApi.fetch_usuario_por_id(usuId);
  }

  Future<List<Usuario>?> fetch_usuario_tutores() async{
    return await _usuarioApi.fetch_usuario_tutores();
  }


  Future<String?> fetch_usuario_rol(String correo) async {
    return await _usuarioApi.fetch_usuario_rol(correo);
  }

  Future<String?> fetch_usuario_nombre(String correo) async {
    return await _usuarioApi.fetch_usuario_nombre(correo);
  }

  Future<String?> fetch_usuario_nombre_por_id(int usuId) async {
    return await _usuarioApi.fetch_usuario_nombre_por_id(usuId);
  }

  Future<bool?> fetch_usuario_motivo(String correo) async {
    return await _usuarioApi.fetch_usuario_motivo(correo);
  }

  Future<String?> fetch_usuario_telefono(String correo) async {
    return await _usuarioApi.fetch_usuario_telefono(correo);
  }

  Future<Usuario?> fetch_usuario_por_cedula(String cedula) async{
    return await _usuarioApi.fetch_usuario_por_cedula(cedula);
  }

  Future<Object> update_usuario_telefono(String correo, String telefono) async{
    return await _usuarioApi.update_usuario_telefono(correo, telefono);
  }

  Future<Object> update_usuario_razon(String correo, String razon) async{
    return await _usuarioApi.update_usuario_razon(correo, razon);
  }

  Future<Object> comprobar_usuario_por_correo(String correo) async{
    return await _usuarioApi.comprobar_usuario_por_correo(correo);
  }

  Future<Usuario?> fetch_usuario_por_correo(String correo) async{
    return await _usuarioApi.fetch_usuario_por_correo(correo);
  }

  Future<Object> update_usuario_a_tutor(json) async{
    return await _usuarioApi.update_usuario_a_tutor(json);
  }

  Future<Object> put_usuario(json) async{
    return await _usuarioApi.put_usuario(json);
  }

  Future<Object> update_usuario_a_tutorado(id) async{
    return await _usuarioApi.update_usuario_a_tutorado(id);
  }

}