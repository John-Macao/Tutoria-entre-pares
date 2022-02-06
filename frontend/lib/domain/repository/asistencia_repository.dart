import 'package:frontend/data/local_db/asistencia_api.dart';
import 'package:frontend/domain/models/asistencia.dart';

class AsistenciaRepository {

  final Asistencia_api _asistenciaApi;

  AsistenciaRepository(this._asistenciaApi);

  Future<Object> put_asistencia(String correo, json) async{
    return await _asistenciaApi.put_asistencia(correo, json);
  }

  Future<List<Asistencia>?> fetch_asistencias_tutorado(String correo) async {
    return await _asistenciaApi.fetch_asistencias_tutorado(correo);
  }

}