import 'dart:js' as js;
import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:get/get.dart';

class MsalService extends GetxController {

  final Rx<UserLogIn> _userLogin = Rx<UserLogIn>(UserLogIn());

  static initialize() {
    Get.put(MsalService());
  }

  @override
  void onInit() {
    super.onInit();
    js.context.callMethod('msalInitialize');
    getCurrentUser();
  }

  login(BuildContext context) {
    js.context.callMethod('login', []);
    //redireccionar(context);
    
  }

  Future redireccionar(BuildContext context) async{
    await Navigator.pushNamed(context, '/verificar-login');
  }

  getCurrentUser() {
    try {
        UserLogIn? user = UserLogIn.fromJson(js.JsObject.fromBrowserObject(js.context.callMethod('getCurrentUser', [])));
      if (user != null) {
        _userLogin.value = user;
        _userLogin.refresh();
        //print('Usuario actual ${user.username}');
        return user;
      }
    } catch (e) {
      UserLogIn? user;
    }
    
    
  }
}