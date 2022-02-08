class Coordinacion {
  final int cooId;
  final String cooAsignatura;
  final String cooDocente;
  final String cooComentario;
  final String cooFehca;
  final int usuId;

  Coordinacion({
    required this.cooId, 
    required this.cooAsignatura, 
    required this.cooDocente, 
    required this.cooComentario,
    required this.cooFehca,
    required this.usuId, 
  });

  static Coordinacion fromJson(Map<String,  dynamic> json) {
    return Coordinacion(
      cooId: json['coo_id'],
      cooAsignatura: json['coo_asignatura'],
      cooDocente: json['coo_docente'],
      cooComentario: json['coo_comentario'],
      cooFehca: json['coo_fecha'],
      usuId: json['usu_id'],
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'coo_id': cooId,
    'coo_asignatura': cooAsignatura,
    'coo_docente': cooDocente,
    'coo_comentario': cooComentario,
    'coo_fecha': cooFehca,
    'usu_id': usuId,
  };

}