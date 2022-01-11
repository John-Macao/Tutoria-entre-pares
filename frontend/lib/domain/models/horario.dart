class Horario {
  final int horId;
  final String horDia;
  final String horHora;
  final DateTime? horFehca;
  final String horTipo;
  final int maofId;
  final int usuId;

  Horario({
    required this.horId, 
    required this.horDia, 
    required this.horHora, 
    required this.horFehca, 
    required this.horTipo, 
    required this.maofId, 
    required this.usuId, 
  });

  static Horario fromJson(Map<String,  dynamic> json) {
    return Horario(
      horId: json['hor_id'],
      horDia: json['hor_dia'],
      horHora: json['hor_hora'],
      horFehca: json['hor_fecha'],
      horTipo: json['hor_tipo'],
      maofId: json['ma_of_id'],
      usuId: json['usu_id'],
    );
  }

}