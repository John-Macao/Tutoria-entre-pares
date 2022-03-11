
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_quitar_tutor_controller.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaQuitarTutor extends StatelessWidget {
  const VistaQuitarTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAzul,
        title: Container( alignment: Alignment.center, child: Text("Quitar Tutor Par", style: TextStyle(fontSize: 23),)),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: SingleChildScrollView(
            child: formularioQuitarTutor(),
            //child: test1(),
        ),
    );
  }
}

class formularioQuitarTutor extends StatelessWidget {
  const formularioQuitarTutor({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuitarTutorController>(
      init: QuitarTutorController(locator.get<UsuarioRepository>(),locator.get<MateriaOfertaRepository>()) ,
      builder: (_){
        return Center(
          child: Container(
            //padding: EdgeInsets.all(50.0),
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 70 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),

            child: Column(
              children: <Widget>[
                const SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text("Cédula :", style: TextStyle(fontSize: 20),),
                    
                    const SizedBox(
                      width: 10,
                    ),
                    
                    SizedBox(
                      width: 160, height: 23,
                    child: CupertinoTextField(
                      controller: _.cedula,
                    ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    ElevatedButton(
                      child: const Text(
                        "Buscar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.buscar();

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
                  ],
                ),

                const SizedBox(height: 50.0,
                  child: Divider(color: Colors.black,), 
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 250),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Nombres:"
                        ),
                        controller: _.nombre,
                      ),
                      SizedBox(height: 25.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Correo:"
                        ),
                        controller: _.correo,
                      ),

                      SizedBox(height: 25.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Carrera:"
                        ),
                        controller: _.carrera,
                      ),

                      SizedBox(height: 25.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Telefono:"
                        ),
                        controller: _.telefono,
                      ),

                      SizedBox(height: 25.0,),

                      TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        enabled: _.comprobar,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(fontSize: 15),
                          labelText: "Nivel:"
                        ),
                        controller: _.nivel,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                    height: 25,
                ),

                Text("Materias del Tutor Par:" , style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: colorAzul),
                  ),

                Obx(()=>
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _.listMaterias.length,
                    itemBuilder: (context, index){
                      return GetBuilder<QuitarTutorController>(
                        id: 'listaMateria',
                        builder: (_){
                          return Center(
                              child: Column(
                                children: [
                                  Text(_.listMaterias[index], style: TextStyle(fontSize: 15),),
                                
                                ],
                            ),
                          );
                        }
                      );
                    }
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        "Eliminar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      _.eliminar(context);

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

                    const SizedBox(
                      width: 20,
                    ),

                    ElevatedButton(
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, "/administrador-principal",);
                      //_.agregar(context);

                      }, 
                      style: ElevatedButton.styleFrom(
                        primary : colorRojo,
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
                  ],
                ),

                const SizedBox(
                    height: 50,
                ),
              ],
            ),
            

            ),
          ),
        );
      }
      
    );
  }
}

class test1 extends StatelessWidget {
  const test1 ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuitarTutorController>(
      init: QuitarTutorController(locator.get<UsuarioRepository>(),locator.get<MateriaOfertaRepository>()) ,
      builder: (_){
        return Container(
                  //margin: EdgeInsets.symmetric(horizontal: 1),
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index)
                    {
                      return Column(
                        children: [
                          ListTile(
                          title: Text("$index"),
                        ),
                        ],
                        
                      );
                    }
                    ),
                  );
      
      },
    );
  }
}
