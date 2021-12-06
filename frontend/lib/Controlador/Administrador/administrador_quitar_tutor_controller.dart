import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuitarTutorController extends GetxController{
  var nombre = TextEditingController();
  var correo = TextEditingController();
  var apellido = TextEditingController();
  var carrera = TextEditingController();
  var telefono = TextEditingController();
  var nivel = TextEditingController();
  var cedula = TextEditingController();
  var n = TextEditingController();
  var materia1 = "Algebra Lineal";
  var materia2 = "Ecuaciones ";
  var materia3 = "Base de datos";
  

  eliminar(){
    print("Quita los datos :  ----" );
  }

  buscar(){
    nombre.text = "John";
    correo.text = "johnm@gmail.com";
    apellido.text = "Macao";
    carrera.text= "Computación";
    telefono.text = "0989449535";
    nivel.text = "noveno";
    n.text = "Algebra Lineal,  Ecuaciones,  Base de datos";
  }

  
}