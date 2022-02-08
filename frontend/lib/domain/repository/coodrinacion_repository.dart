import 'package:frontend/data/local_db/coordinacion_api.dart';
import 'package:frontend/domain/models/coordinacion.dart';

class CoordinacionRepository {
  final Coordinacion_api _coordinacionApi;

  CoordinacionRepository(this._coordinacionApi);

  Future<List<Coordinacion>?> fetch_coordinacion_tutor(String correo) async {
    return await _coordinacionApi.fetch_coordinacion_tutor(correo);
  }

  Future<Coordinacion?> fetch_coordinacion_por_id(int id) async {
    return await _coordinacionApi.fetch_coordinacion_por_id(id);
  }

  Future<Object> put_coordinacion(String correo, json) async{
    return await _coordinacionApi.put_coordinacion(correo, json);
  }

  Future<Object> update_coordinacion(json) async{
    return await _coordinacionApi.update_coordinacion(json);
  }
  
  Future<Object> delete_coordinacion(json) async{
    return await _coordinacionApi.delete_coordinacion(json);
  }
    
}