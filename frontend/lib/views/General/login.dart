import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/General/login_controller.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_service_locator.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_){
        return Scaffold(
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EscogerAsignatura(),
                HorarioTabla(),
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
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: 
                Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Materia', style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              DataColumn(label: 
                Text('Contacto', style: TextStyle(fontWeight: FontWeight.bold),)
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
            rows: List<DataRow>.generate(
              _.listUsuario.length,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(_.listUsuario[index].usuNomrbe),
                  ),
                  DataCell(
                    Text(_.asignatura.value),
                  ),
                  DataCell(
                    Text(_.listUsuario[index].usuTelefono),
                  ),
                  DataCell(
                    Text(_.listLunes[index]!=null?_.listLunes[index]:''),
                  ),
                  DataCell(
                    Text(_.listMartes[index]!=null?_.listMartes[index]:''),
                  ),
                  DataCell(
                    Text(_.listMiercoles[index]!=null?_.listMiercoles[index]:''),
                  ),
                  DataCell(
                    Text(_.listJueves[index]!=null?_.listJueves[index]:''),
                  ),
                  DataCell(
                    Text(_.listViernes[index]!=null?_.listViernes[index]:''),
                  ),
                ]
              )
            ),
          ),
        );
      }
    );
  }
}
