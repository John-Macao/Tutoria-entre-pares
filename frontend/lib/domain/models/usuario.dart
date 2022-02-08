class Usuario {
  final int usuId;
  final String usuCorreo;
  final String usuNomrbe;
  final String usuCedula;
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
    required this.usuCedula,
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
      usuNomrbe: json['usu_nombre'],
      usuCedula: json['usu_cedula'],
      usuEstado: json['usu_estado'],
      usuTelefono: json['usu_telefono'],
      usuBeca: json['usu_beca'],
      usuNivel: json['usu_nivel'],
      usuCarrera: json['usu_carrera'],
      usuRazon: json['usu_razon'],
      tuId: json['tu_id'],
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'usu_id': usuId,
    'usu_correo': usuCorreo,
    'usu_nombre': usuNomrbe,
    'usu_cedula': usuCedula,
    'usu_estado': usuEstado,
    'usu_telefono': usuTelefono,
    'usu_beca': usuBeca,
    'usu_nivel': usuNivel,
    'usu_carrera': usuCarrera,
    'usu_razon': usuRazon,
    'tu_id': tuId,
  };

}