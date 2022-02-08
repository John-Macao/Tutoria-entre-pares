import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/models/materia_oferta.dart';

class MateriaOfertaRepository {
  final MateriaOferta_api _materiaOfertaApi;

  MateriaOfertaRepository(this._materiaOfertaApi);

  Future<List<MateriaOferta>?> fetch_materias_unicas() async {
    return await _materiaOfertaApi.fetch_materias_unicas();
  }

  Future<List<MateriaOferta>?> fetch_materias_por_materia(int idMateriaApi) async {
    return await _materiaOfertaApi.fetch_materias_por_materia(idMateriaApi);
  }

  Future<MateriaOferta?> fetch_materia__por_ip(int id) async {
    return await _materiaOfertaApi.fetch_materia__por_ip(id);
  }

 Future<List<MateriaOferta>?> fetch_materia_por_tutor(String correo) async {
    return await _materiaOfertaApi.fetch_materia_por_tutor(correo);
  }

  Future<Object> update_deshabilitar_materia(correoTutor, idMateria) async{
    return await _materiaOfertaApi.update_deshabilitar_materia(correoTutor, idMateria);
  }

  Future<Object> put_materia_oferta(correoTutor, idMateriaApi) async{
    return await _materiaOfertaApi.put_materia_oferta(correoTutor, idMateriaApi);
  }
}