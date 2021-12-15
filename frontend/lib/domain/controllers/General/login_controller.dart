import 'package:flutter/cupertino.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  //este metodo llama al metodo del inicio de sesion que se encuentra en una clase estatica
  login(BuildContext context) {
    MsalService().login(context);
    
  }

}

