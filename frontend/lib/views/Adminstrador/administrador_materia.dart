
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_materia_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaMateria extends StatelessWidget {
  const VistaMateria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
      title: Text("Asignar/Quitar Materia"),
      ),
      drawer: MenuView.getDrawer(context),
      //drawer: Menu.getDrawer(context),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: formularioMateria(),
        ),
        
      )
    );
  }
}

class formularioMateria extends StatelessWidget {
  const formularioMateria({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MateriaController>(
      init: MateriaController(locator.get<MateriaOfertaRepository>(),locator.get<UsuarioRepository>()),
      builder: (_){
        return Form(
          child: Column(
            children: [
              Text("Cédula: "),
              CupertinoTextField(
                controller: _.cedula,
              ),
              TextButton(
                onPressed: (){
                  _.buscar();
                }, 
                child: Text("Buscar")
              ),

              Text("Nombre: "),
              Text(_.nombre),
              Text("Carrera: "),
              Text(_.carrera),

              Text("Materias: "),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.listMateriasOfertadas.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Text(_.listMateriasOfertadas[index]),
                      TextButton(
                        onPressed: (){
                          _.deshabilitar(_.listMateriasOfertadas[index]);
                        }, 
                        child: Text("Deshabilitar")
                      ),
                    ],
                  );
                }
              ),

              Text("Calificación minima: "),
              CupertinoTextField(
                controller: _.calificacion,
              ),
              TextButton(
                onPressed: (){
                  _.buscarMaterias();
                }, 
                child: Text("Buscar")
              ),
              
              ListView.builder(
                shrinkWrap: true,
                itemCount: _.listMateriasPosibles.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Text(_.listMateriasPosibles[index]),
                      TextButton(
                        onPressed: (){
                          _.agregarMateria(_.listMateriasPosibles[index]);
                        }, 
                        child: Text("Asignar materia")
                      ),
                    ],
                  );
                }
              ),
              

            ],
           
          )
          
          
          );
          

      },
      
    );
  }
}