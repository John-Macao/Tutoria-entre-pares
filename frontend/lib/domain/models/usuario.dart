class Usuario {
  final int usuId;
  final String usuCorreo;
  final String usuNomrbe;
  final String usuEstado;
  final String usuTelefono;
  final String usuBeca;
  final int usuNivel;
  final String usuCarrera;
  final String usuRazon;
  final int tuId;

  Usuario({
    required this.usuId, 
    required this.usuCorreo, 
    required this.usuNomrbe, 
    required this.usuEstado, 
    required this.usuTelefono, 
    required this.usuBeca, 
    required this.usuNivel, 
    required this.usuCarrera, 
    required this.usuRazon, 
    required this.tuId, 
  });

  static Usuario fromJson(Map<String,  dynamic> json) {
    return Usuario(
      usuId: json['usu_id'],
      usuCorreo: json['usu_correo'],
      usuNomrbe: json['usu_nomrbe'],
      usuEstado: json['usu_estado'],
      usuTelefono: json['usu_telefono'],
      usuBeca: json['usu_beca'],
      usuNivel: json['usu_nivel'],
      usuCarrera: json['usu_carrera'],
      usuRazon: json['usu_razon'],
      tuId: json['tu_id'],
    );
  }

}