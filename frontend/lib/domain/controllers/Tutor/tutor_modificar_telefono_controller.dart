import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TutorModificarTelefonoController extends GetxController{
  
  String nombre ='';
  var numero = TextEditingController();
  
  @override
  void onInit(){
    super.onInit();
    //con conexion a base de datos
    nombre = 'Pablo Esteban Loja Morocho';
    numero.text = '0998476387';
  }

  modificar(){
    print('Se manda a guardadr este numero: ' + numero.text);
  }
  
}