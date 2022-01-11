class Asistencia {
  final int asiId;
  final String asiTema;
  final int asiHoras;
  final String asiTipo;
  final int docidApi;
  final int horId;
  final int usuId;

  Asistencia({
    required this.asiId, 
    required this.asiTema, 
    required this.asiHoras, 
    required this.asiTipo, 
    required this.docidApi, 
    required this.horId, 
    required this.usuId, 
  });

  static Asistencia fromJson(Map<String,  dynamic> json) {
    return Asistencia(
      asiId: json['asi_id'],
      asiTema: json['asi_tema'],
      asiHoras: json['asi_horas'],
      asiTipo: json['asi_tipo'],
      docidApi: json['doc_id_api'],
      horId: json['hor_id'],
      usuId: json['usu_id'],
    );
  }

}