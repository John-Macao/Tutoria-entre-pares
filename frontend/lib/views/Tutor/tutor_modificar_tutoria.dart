import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_modificar_tutoria_controller.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorModificarTutoria extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTutoriaController>(
      init: TutorModificarTutoriaController(),
      builder: (_){
        return Scaffold(
        appBar: AppBar(
          title: Text('Modificar Horario de Tutoría'),
        ),
      drawer: MenuView.getDrawer(context),
      //drawer: TutorMenu.getDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HorarioInicio(),
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}




class HorarioInicio extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTutoriaController>(
      id: 'horario',
      builder: (_){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: 
                Text('Hora', style: TextStyle(fontWeight: FontWeight.bold),)
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
              _.horas.length,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(_.horas[index]),
                  ),
                  DataCell(
                    Text(_.mlunes[_.horas[index]]?.maofId!=null?_.materiaNombre[_.mlunes[_.horas[index]]!.horId]!:''),
                    onTap: () async {
                      if(_.mlunes[_.horas[index]]!=null){
                        await modificarHorario(context, _.mlunes[_.horas[index]]!, _.materiaNombre[_.mlunes[_.horas[index]]!.horId]!, _.horas[index],'Lunes');
                        _.actualizarHorario();
                        // _.seleccionarHorario(_.mlunes[_.horas[index]]!);
                      }else{
                        await agregarNuevo(context, _.horas[index],'Lunes');
                        _.actualizarHorario();
                        //_.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mmartes[_.horas[index]]?.maofId!=null?_.materiaNombre[_.mmartes[_.horas[index]]!.horId]!:''),
                    onTap: () async {
                      if(_.mmartes[_.horas[index]]!=null){
                        await modificarHorario(context, _.mmartes[_.horas[index]]!, _.materiaNombre[_.mmartes[_.horas[index]]!.horId]!, _.horas[index],'Martes');
                        _.actualizarHorario();
                        // _.seleccionarHorario(_.mlunes[_.horas[index]]!);
                      }else{
                        await agregarNuevo(context, _.horas[index],'Martes');
                        _.actualizarHorario();
                        //_.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mmiercoles[_.horas[index]]?.maofId!=null?_.materiaNombre[_.mmiercoles[_.horas[index]]!.horId]!:''),
                    onTap: () async {
                      if(_.mmiercoles[_.horas[index]]!=null){
                        await modificarHorario(context, _.mmiercoles[_.horas[index]]!, _.materiaNombre[_.mmiercoles[_.horas[index]]!.horId]!, _.horas[index],'Miercoles');
                        _.actualizarHorario();
                        // _.seleccionarHorario(_.mlunes[_.horas[index]]!);
                      }else{
                        await agregarNuevo(context, _.horas[index],'Miercoles');
                        _.actualizarHorario();
                        //_.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mjueves[_.horas[index]]?.maofId!=null?_.materiaNombre[_.mjueves[_.horas[index]]!.horId]!:''),
                    onTap: () async {
                      if(_.mjueves[_.horas[index]]!=null){
                        await modificarHorario(context, _.mjueves[_.horas[index]]!, _.materiaNombre[_.mjueves[_.horas[index]]!.horId]!, _.horas[index],'Jueves');
                        _.actualizarHorario();
                        // _.seleccionarHorario(_.mlunes[_.horas[index]]!);
                      }else{
                        await agregarNuevo(context, _.horas[index],'Jueves');
                        _.actualizarHorario();
                        //_.seleccionarVacio();
                      }
                    }
                  ),
                  DataCell(
                    Text(_.mviernes[_.horas[index]]?.maofId!=null?_.materiaNombre[_.mviernes[_.horas[index]]!.horId]!:''),
                    onTap: () async {
                      if(_.mviernes[_.horas[index]]!=null){
                        await modificarHorario(context, _.mviernes[_.horas[index]]!, _.materiaNombre[_.mviernes[_.horas[index]]!.horId]!, _.horas[index],'Viernes');
                        _.actualizarHorario();
                        // _.seleccionarHorario(_.mlunes[_.horas[index]]!);
                      }else{
                        await agregarNuevo(context, _.horas[index],'Viernes');
                        _.actualizarHorario();
                        //_.seleccionarVacio();
                      }
                    }
                  ),
                ]
              )
            ),
          ),
        );
      }
    );
  }

  Future agregarNuevo(BuildContext context, hora, dia) async{
    return showDialog<ModificarHorario>(
      context: context, 
      builder: (p){
          return AlertDialog(
            title: Text('Agrgar Horario de Tutoría'),
            content: Column(
              children: [
                Form(child: Column(
                  children: [
                    GetBuilder<ModificarHorario>(
                      init: ModificarHorario(),
                      builder: (_){
                        _.dia = dia;
                        _.hora = hora;
                        return Column(
                          children: [
                              Text('Dia: '),
                                Text(dia),
                                Text('Hora: '),
                                Text(hora),
                                Text('Asignatura: '),
                                Obx(() =>
                                    DropdownButton<String>(
                                    hint: Text('Seleccionar dia'),
                                    value: _.asignatura.value,
                                    onChanged: (String? seleccionado){
                                      _.asignatura.value = seleccionado!;
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
                                TextButton(
                                  onPressed: () async {
                                    await _.agregarHorario();
                                    Navigator.pop(context);
                                  }, 
                                  child: Text('Agregar horario')
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Canselar')
                                ),
                          ],
                        );
                      }
                    ),
                  ],
                )
                ),
              ],
            ),
          );
        }
      );
  }

  Future modificarHorario(BuildContext context, Horario horario, String materia, hora, dia) async{
    return showDialog<ModificarHorario>(
      context: context, 
      builder: (p){
          return AlertDialog(
            title: Text('Agrgar Horario de Tutoría'),
            content: Column(
              children: [
                Form(child: Column(
                  children: [
                    GetBuilder<ModificarHorario>(
                      init: ModificarHorario(),
                      builder: (_){
                        _.asignatura.value = materia;
                        _.dia = horario.horDia;
                        _.hora = horario.horHora;
                        return Column(
                          children: [
                              Text('Dia: '),
                                Text(dia),
                                Text('Hora: '),
                                Text(hora),
                                Text('Asignatura: '),
                                Obx(() =>
                                    DropdownButton<String>(
                                    hint: Text('Seleccionar dia'),
                                    value: _.asignatura.value,
                                    onChanged: (String? seleccionado){
                                      _.asignatura.value = seleccionado!;
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
                                TextButton(
                                  onPressed: () async {
                                    await _.actualizarHorario(horario);
                                    Navigator.pop(context);
                                  }, 
                                  child: Text('Actualizar horario')
                                ),
                                TextButton(
                                  onPressed: ()async{
                                    await _.eliminarHorario(horario);
                                    Navigator.pop(context);
                                  }, 
                                  child: Text('Eliminar horario')
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Canselar')
                                ),
                          ],
                        );
                      }
                    ),
                  ],
                )
                ),
              ],
            ),
          );
        }
      );
  }

}

