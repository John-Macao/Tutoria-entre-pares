import 'dart:js' show JsObject;

class UserLogIn {

  String? tenantId;
  String? name;
  String? username;

  UserLogIn({this.tenantId, this.name, this.username});

  static UserLogIn? fromJson(JsObject data) {
    return data['tenantId'] != null ? UserLogIn(
      tenantId: data['tenantId'],
      name: data['name'],
      username: data['username']
    ) : null;
  }

}