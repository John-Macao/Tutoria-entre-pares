import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutorado/tutorado_horario_tutor_controller.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TutoradoHorarioTutor extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Par Inicio'),
      ),
      drawer: MenuView.getDrawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AsignaturaDeTabla(),
              TablaTutorHorario(),
            ],
          ),
        ),
      ),
    );
  }
}


class AsignaturaDeTabla extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoHorarioTutorController>(
      init: TutoradoHorarioTutorController(),
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


class TablaTutorHorario extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutoradoHorarioTutorController>(
      init: TutoradoHorarioTutorController(),
      builder: (_){
        return PaginatedDataTable(
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
          source: TutoradoTutorMiDataTableSource(_.listUsuario,_.listLunes,_.listMartes,_.listMiercoles,_.listJueves,_.listViernes,_.asignatura.value)
        );
      }
    );
  }
}