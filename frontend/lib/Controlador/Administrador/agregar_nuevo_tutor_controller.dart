
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AgregarNuevoTutorController extends GetxController {

  var nombre = TextEditingController();
  var correo = TextEditingController();
  var apellido = TextEditingController();
  var carrera = TextEditingController();
  var telefono = TextEditingController();
  var nivel = TextEditingController();
  var cedula = TextEditingController();

  agregar(){
    print("guarda los datos :  ----" + nombre.text );
  }

  buscar(){
    nombre.text = "John";
    correo.text = "johnm@gmail.com";
    apellido.text = "Macao";
    carrera.text= "Computación";
    telefono.text = "0989449535";
    nivel.text = "noveno";
  }

}