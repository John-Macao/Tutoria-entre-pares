
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_principal_controller.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaPrincipal extends StatelessWidget {
  const VistaPrincipal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PrincipalController>(
      init: PrincipalController(locator.get<UsuarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<HorarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Administrador", style: TextStyle(fontSize: 23),)),

          ),
          drawer: MenuView.getDrawer(context),
          //drawer: Menu.getDrawer(context),
          body: SingleChildScrollView(
            child: Center(
            child: Column(
              children: [
                Formulario(),
                TutoresTabla(),
              ],
            ),
          ),
          ),
        );
      }
    );
  }
}


class Formulario extends StatelessWidget{
  const Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<PrincipalController>(
      id: 'formulario',
      builder: (_){
        return Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 20.0),

          child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() =>
              DropdownButton<String>(
                style: TextStyle(color: colorAzul, fontSize: 18) ,
                icon: Icon(Icons.filter_alt_outlined),
                dropdownColor: Colors.indigo[50],
              hint: Text('Seleccionar asignatura'),
              value: _.opcion.value,
              onChanged: (String? seleccionado){
                _.opcion.value = seleccionado!;
                _.cambioOpcion();
              },
              items: _.opciones
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              ),
            ),

            SizedBox(width: 15.0),

            if (_.opcion == 'Cedula') ...[
              SizedBox(
                width: 160, height: 25,
              child: CupertinoTextField(
                controller: _.cedula,
              ),
              ),
              const SizedBox(width: 15.0 ),

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
                _.buscarPorCedula();

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



            ] else if(_.opcion == 'Materia')...[
              Obx(() =>
                  DropdownButton<String>(
                  hint: Text('Seleccionar asignatura'),
                  value: _.asignatura.value,
                  onChanged: (String? seleccionado){
                    _.asignatura.value = seleccionado!;
                  },
                  items: _.listAsignaturas
                        .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                  }).toList(),
                ),
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
                _.buscarPorMateria();

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
          ],
          ),
        );
      }
    );
  }
}

class TutoresTabla extends StatelessWidget{
  TutoresTabla({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrincipalController>(
      id: 'tabla',
      builder: (_){
        if (_.estadoTablaPrincipal) {
          return Center(child: CircularProgressIndicator( color: colorAzul, strokeWidth: 4.0,));
        }
        return Card(
          elevation: 10,
          margin: EdgeInsets.symmetric(horizontal: 150, vertical: 1 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
          
          child: Column(
            children: [
              if (_.opcion.value == 'Cedula') ...[
                PaginatedDataTable(
                  arrowHeadColor: colorAzul,
                  //columnSpacing: 50,
                  rowsPerPage: 9,
                  columns: const <DataColumn>[
                    DataColumn(label: 
                      Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    DataColumn(label: 
                      Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    DataColumn(label: 
                      Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    DataColumn(label: 
                      Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    DataColumn(label: 
                      Text('Nivel', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    DataColumn(label: 
                      Text('Carrera', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                  ], 
                  source: CedulaMiDataTableSource(_.listTutores,_.materias)
                ),
              ] else if(_.opcion.value == 'Materia')...[
                PaginatedDataTable(
                  rowsPerPage: 9,
                  arrowHeadColor: colorAzul,
                  //columnSpacing: 50,
                  columns: const <DataColumn>[
                    DataColumn(label: 
                      Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
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
                  source: MateriaMiDataTableSource(_.listTutores,_.listLunes,_.listMartes,_.listMiercoles,_.listJueves,_.listViernes,_.asignatura.value)
                ),
              ],
            ],
          
        ),
        );
      }
    );
  }
}
