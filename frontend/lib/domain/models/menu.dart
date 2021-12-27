class Menu {
  final int menid;
  final String mendescripcion;
  final String menurl;
  final String menicono;
  final String menestado;
  final String mentipo;
  final int? menfkid;

  Menu({
    required this.menid, 
    required this.mendescripcion, 
    required this.menurl, 
    required this.menicono, 
    required this.menestado,
    required this.mentipo,
    required this.menfkid,
    });

    static Menu fromJson(Map<String,  dynamic> json) {
      return Menu(
        menid: json['men_id'],
        mendescripcion: json['men_descripcion'],
        menurl: json['men_url'],
        menicono: json['men_icono'],
        menestado: json['men_estado'],
        mentipo: json['men_tipo'],
        menfkid: json['men_fkid'],
      );
    }

}