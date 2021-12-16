import 'package:flutter/cupertino.dart';
import 'package:frontend/data/remote/http/prueba_servicio.dart';
import 'package:frontend/domain/models/modelo_prueba.dart';
import 'package:get/get.dart';

class QuitarTutorController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    print("igual a onReady");
    this.cargaTest();
    
  }


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

  //varibales de test
  List<Prueba> _test = [];
  List<Prueba> get test => _test;
  bool _loadingTest = true;
  bool get loadingTest => _loadingTest;

  
  

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

  // Metodo Dio 
  Future<void> cargaTest() async {
    final data = await PruebaServicio.instace.obtener();
    this._test = data!;
    this._loadingTest = false;
    print("Ternima la peticion --- ");
    //update(['usersTest']);
  }

  
}