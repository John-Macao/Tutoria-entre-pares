class Ejemplo {
  var api;
  var descripcion;
  var auth;
  var https;
  var cors;
  var link;
  var category;


  Ejemplo({
    required this.api,
    required this.descripcion,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Ejemplo.fromJson(Map<dynamic, dynamic> json) {
    return Ejemplo(
      api: json['API'],
      descripcion: json['Description'],
      auth: json['Auth'],
      https: json['HTTPS'],
      cors: json['Cors'],
      link: json['Link'],
      category: json['Category'],
    );
  }
}