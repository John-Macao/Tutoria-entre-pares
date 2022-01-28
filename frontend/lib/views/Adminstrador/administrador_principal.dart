
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_principal_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class VistaPrincipal extends StatelessWidget {
  const VistaPrincipal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PrincipalController>(
      init: PrincipalController(),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: const Text("Administrador"),
          ),
          drawer: MenuView.getDrawer(context),
          //drawer: Menu.getDrawer(context),
          body: Center(
            child: Column(
              children: [
                FormularioAdmin(),
                TutoresTabla(),
              ],
            ),
          ),
        );
      }
    );
    
    
    
  }
}


class FormularioAdmin extends StatelessWidget{
  const FormularioAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<PrincipalController>(
      id: 'formulario',
      builder: (_){
        return Column(
          children: [
            Obx(() =>
                DropdownButton<String>(
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

            if (_.opcion == 'Cedula') ...[
              CupertinoTextField(
                controller: _.cedula,
              ),
              TextButton(
                onPressed: (){
                  _.buscarPorCedula();
                }, 
                child: Text('Buscar')
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
              TextButton(
                onPressed: (){
                  _.buscarPorMateria();
                }, 
                child: Text('Buscar')
              ),
            ],
            

          ],
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
        return Column(
            children: [
              if (_.opcion.value == 'Cedula') ...[
                PaginatedDataTable(
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
          
        );
      }
    );
  }
}
