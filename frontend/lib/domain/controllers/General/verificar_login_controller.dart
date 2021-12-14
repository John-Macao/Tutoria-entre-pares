import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/UserLogIn.dart';
import 'package:get/get.dart';

class VerificarLoginController extends GetxController {
  
    @override
  void onInit() {
    super.onInit();
    UserLogIn usuarioLogin = MsalService().getCurrentUser();

    print('el usuario es: ' + usuarioLogin.username.toString());  
  
  }

}