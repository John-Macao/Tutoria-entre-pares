import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_modificar_telefono_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:frontend/views/Tutor/tutor_menu.dart';
import 'package:get/get.dart';

class TutorModificarTelefono extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Modificar Teléfono", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              formularioTelefono(),
            ],
          ),
        ),
      ),
    );
  }
}


class formularioTelefono extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTelefonoController>(
      init: TutorModificarTelefonoController(locator.get<UsuarioRepository>()),
      builder: (_){
        return Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

          child: Column(
            children: [
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tutor par:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  Text(_.nombre, style: TextStyle(fontSize: 17,)),
                ]
              ),

              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Número Telefonico:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(width: 15,),
                  SizedBox( width: 120,
                    child: CupertinoTextField(
                    controller: _.numero,
                  ),
                  ),
                  
                ]
              ),

              SizedBox(height: 25,),

              ElevatedButton(
                child: const Text(
                  "Modificar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              onPressed: (){
                _.modificar().then(
                  (value) {
                    if(value){
                      mensajeEditado(context);
                    }
                  }

                );

                }, 
                style: ElevatedButton.styleFrom(
                  primary : colorAzul,
                  shape:
                  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                      Radius.circular(10),
                    bottomRight:
                      Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                ),
              ),

              SizedBox(height: 50,),

            ],
          )
        );
      }
    );
  }

  void mensajeEditado (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Modificar", style: TextStyle(fontWeight: FontWeight.bold , color: colorAzul),),
          content: const Text("Teléfono editado correctamente"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Aceptar", style: TextStyle(color: colorAzul)),
            ),
          ],
        );
      },
    );
  }
}