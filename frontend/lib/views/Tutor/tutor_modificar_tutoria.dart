import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Tutor/tutor_modificar_tutoria_controller.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/repository/horario_repository.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';

class TutorModificarTutoria extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<TutorModificarTutoriaController>(
      init: TutorModificarTutoriaController(locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>()),
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorAzul,
            title: Container( alignment: Alignment.center, child: Text("Modificar/Agregar Horario de Tutoría", style: TextStyle(fontSize: 23),)),
          ),
        drawer: MenuView.getDrawer(context),
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
        return Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric( vertical: 20 ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
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
            title: Text('Agregar Horario de Tutoría', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: colorAzul),),
            content: Column(
              children: [
                Form(child: Column(
                  children: [
                    GetBuilder<ModificarHorario>(
                      init: ModificarHorario(locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>()),
                      builder: (_){
                        _.dia = dia;
                        _.hora = hora;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                Text('Dia:',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Text(dia,  style: TextStyle(fontSize: 17),),
                              ],
                            ),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                Text('Hora:',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,)),
                                SizedBox(width: 10,),
                                Text(hora, style: TextStyle(fontSize: 17),),
                                
                              ],
                            ),
                            SizedBox(height: 20,), 

                                Text('Asignatura: ',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
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

                                SizedBox( height: 20,),

                                ElevatedButton(
                                  child: const Text(
                                    "Agregar Horario",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await _.agregarHorario();
                                    Navigator.pop(context);
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

                                SizedBox( height: 20,),

                                ElevatedButton(
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                onPressed: () => Navigator.pop(context),

                                  style: ElevatedButton.styleFrom(
                                    primary : Colors.red,
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
            title: Text('Modificar Horario de Tutoría'),
            content: Column(
              children: [
                Form(child: Column(
                  children: [
                    GetBuilder<ModificarHorario>(
                      init: ModificarHorario(locator.get<HorarioRepository>(), locator.get<MateriaOfertaRepository>(), locator.get<UsuarioRepository>()),
                      builder: (_){
                        _.asignatura.value = materia;
                        _.dia = horario.horDia;
                        _.hora = horario.horHora;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                Text('Dia:',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Text(dia,  style: TextStyle(fontSize: 17),),
                              ],
                            ),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                Text('Hora:',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,)),
                                SizedBox(width: 10,),
                                Text(hora, style: TextStyle(fontSize: 17),),
                                
                              ],
                            ),
                            SizedBox(height: 20,), 

                            Text('Asignatura: ',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

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

                                SizedBox( height: 20,),


                                ElevatedButton(
                                  child: const Text(
                                    "Actualizar Horario",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await _.actualizarHorario(horario);
                                    Navigator.pop(context);
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

                                SizedBox( height: 20,),

                                ElevatedButton(
                                  child: const Text(
                                    "Eliminar Horario",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                onPressed: ()async{
                                    await _.eliminarHorario(horario);
                                    Navigator.pop(context);
                                  }, 

                                  style: ElevatedButton.styleFrom(
                                    primary : colorAzulClaro,
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

                                SizedBox( height: 20,),

                                ElevatedButton(
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),

                                  style: ElevatedButton.styleFrom(
                                    primary : Colors.red,
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

