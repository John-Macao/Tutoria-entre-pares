
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MateriaController extends GetxController{
  var nombre = TextEditingController();
  var carrera = TextEditingController();
  var cedula = TextEditingController();
  var calificacion = TextEditingController();
  var materias = TextEditingController();
  eliminar(){
    print("Quita los datos :  ----" );
  }

  buscar(){
    nombre.text = "John";
    carrera.text= "Computación";
  }
  
  buscarMaterias(){
    materias.text = "Fisica,   Ecuaciones Diferenciales";
  }



}