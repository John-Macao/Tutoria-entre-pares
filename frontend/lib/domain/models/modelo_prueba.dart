
class Prueba {
  int userId;
  int id;
  String title;
  String body;

  Prueba({ required this.userId,  required this.id, required this.title, required this.body});

  static Prueba fromJson(Map<String, dynamic> json){
    return Prueba(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

}