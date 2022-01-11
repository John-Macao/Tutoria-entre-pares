class MateriaOferta {
  final int maofId;
  final String maofEstado;
  final int idMateriaApi;
  final int usuId;

  MateriaOferta({
    required this.maofId, 
    required this.maofEstado, 
    required this.idMateriaApi, 
    required this.usuId, 
  });

  static MateriaOferta fromJson(Map<String,  dynamic> json) {
    return MateriaOferta(
      maofId: json['ma_of_id'],
      maofEstado: json['ma_of_estado'],
      idMateriaApi: json['id_materia_api'],
      usuId: json['usu_id']
    );
  }

}