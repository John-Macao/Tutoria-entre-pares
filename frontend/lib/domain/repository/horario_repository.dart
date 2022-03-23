import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/domain/models/horario.dart';

class HorarioRepository {
  final Horario_api _horarioApi;

  HorarioRepository(this._horarioApi);

  Future<List<Horario>?> fetch_horarios_fijo(String correo) async {
    return await _horarioApi.fetch_horarios_fijo(correo);
  }

  Future<List<Horario>?> fetch_horarios_fijo_de_materia_y_usuario(int usuId, int maofId) async {
    return await _horarioApi.fetch_horarios_fijo_de_materia_y_usuario(usuId, maofId);
  }

  Future<List<Horario>?> fetch_horarios_sesion(String correo) async {
    return await _horarioApi.fetch_horarios_sesion(correo);
  }

  Future<Horario?> fetch_horarios_id(int horId) async {
    return await _horarioApi.fetch_horarios_id(horId);
  }
  
  Future<int?> fetch_ultimo_horario_creado(String correo) async {
    return await _horarioApi.fetch_ultimo_horario_creado(correo);
  }

  Future<Object> put_horario_tutor_sesion(String correo, json) async{
    return await _horarioApi.put_horario_tutor_sesion(correo, json);
  }

  Future<Object> put_horario_tutor(String correo, json) async{
    return await _horarioApi.put_horario_tutor(correo, json);
  }

  Future<Object> update_horario_tutor(json) async{
    return await _horarioApi.update_horario_tutor(json);
  }
  
  Future<Object> update_horario_tutor_sesion(json) async{
    return await _horarioApi.update_horario_tutor_sesion(json);
  }

  Future<Object> delete_horario_tutor(json) async{
    return await _horarioApi.delete_horario_tutor(json);
  }
    
}