import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/General/login_controller.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>(), locator.get<HorarioRepository>()),
      builder: (_){
        return Scaffold(
          /*
          appBar: AppBar(
            title: Text('Inicio'),
            actions: [
              TextButton(
                onPressed: (){
                  _.login(context);
                }, 
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          */
          backgroundColor: Colors.indigo[50],
          body: Container(
            //child: Card(
              //elevation: 10,

              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  flex: 1,
                  child: LateralIzquierdo(),
                  ),
                Expanded(
                  flex: 6,
                  child: LateralDerecho()
                )
                
              ],
            ),
          ),
          //),
        );
      }
    );
    
    
  }
}
class LateralIzquierdo extends StatelessWidget {
  const LateralIzquierdo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_){
        return Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
          child: Container(
            child: Column(
          children: [
            Image.asset("imagenes/img-asu.png", width: 400, height: 200 ),
            Image.asset("imagenes/img-ietaes.png", width: 400, height: 200),
            
            
            /*Material(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              //child: Image.asset("imagenes/img-asu.png"),
              //child: Center(
                            child: Hero(
                              tag: 'img', 
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.asset(
                                  "imagenes/img-asu.png",
                                  //fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          //),
            ),
            */


          ],
          ),
          ),
          ),
        );
      
      }
      
    );
  }
}

class LateralDerecho extends StatelessWidget {
  const LateralDerecho ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'horario',
      builder: (_){
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Expanded(
                  flex: 9,
                  child: Align(
                    //alignment: Alignment.center,
                    child: Text("GRUPO DE INNOVACIÓN EDUCATIVA EN TUTORÍAS ACADÉMICAS AL ESTILO SALESIANO", 
                    style: TextStyle( color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ),
                ),
            
            //const SizedBox(width: 200.0,),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                child: const Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              onPressed: (){
                _.login(context);

                }, 
                style: ElevatedButton.styleFrom(
                  primary : colorPrimario,
                  shape:
                  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                      Radius.circular(10),
                    bottomRight:
                      Radius.circular(10),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                ),
              ),
              /*TextButton(
                onPressed: (){
                  _.login(context);
                    }, 
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  */
            )
            ],
            ),

            const SizedBox(height: 15.0,),
            
            Align(
              alignment: Alignment.center,
              child: Column(
                 
                
                children: [

            const Text('Filtro de Materia:'),
            Obx(() =>
                DropdownButton<String>(
                hint: Text('Seleccionar asignatura'),
                value: _.asignatura.value,
                onChanged: (String? seleccionado){
                  _.asignatura.value = seleccionado!;
                  _.buscar();
                },
                items: _.listAsignatura
                      .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    );
                }).toList(),
              ),
            ),
                ],
              ),
            ),

            const SizedBox(height: 2.0,),
            
            Card(
              elevation: 10,
              //margin: EdgeInsets.symmetric(horizontal: 100, vertical: 1 ),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15),
              ),
              child: PaginatedDataTable(
                arrowHeadColor: Colors.red,
                columnSpacing: 80,
              columns: const <DataColumn>[
                DataColumn(label: 
                  Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Contacto', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Lunes', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Martes', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Miércoles', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Jueves', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                DataColumn(label: 
                  Text('Viernes', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ], 
                source: InicioTutorMiDataTableSource(_.listUsuario,_.listLunes,_.listMartes,_.listMiercoles,_.listJueves,_.listViernes,_.asignatura.value)
              ),

            )

          ],
        ),
          ),
      );
      }
      
    );
  }
}
















class EscogerAsignatura extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<LoginController>(
      id: 'horario',
      builder: (_){
        return Column(
          children: [
            Text('Matteria: '),
            Obx(() =>
                DropdownButton<String>(
                hint: Text('Seleccionar asignatura'),
                value: _.asignatura.value,
                onChanged: (String? seleccionado){
                  _.asignatura.value = seleccionado!;
                  _.buscar();
                },
                items: _.listAsignatura
                      .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                    );
                }).toList(),
              ),
            ),
          ],
        );
      }
    );
  }
}

class HorarioTabla extends StatelessWidget{
  HorarioTabla({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'horario',
      builder: (_){
        return Center(
          child: Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 300, vertical: 1 ),
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15),
          ),
          child: PaginatedDataTable(
            arrowHeadColor: Colors.red,
            columnSpacing: 100,
          columns: const <DataColumn>[
            DataColumn(label: 
              Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Contacto', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Lunes', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Martes', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Miércoles', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Jueves', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            DataColumn(label: 
              Text('Viernes', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
          ], 
          source: InicioTutorMiDataTableSource(_.listUsuario,_.listLunes,_.listMartes,_.listMiercoles,_.listJueves,_.listViernes,_.asignatura.value)
        ),
        ),
        );
      }
    );
  }
}
