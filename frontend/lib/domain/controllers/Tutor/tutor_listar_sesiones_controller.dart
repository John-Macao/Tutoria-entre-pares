import 'dart:convert';

import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/horario.dart';
import 'package:frontend/domain/models/materia_oferta.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutorListarSesionesController extends GetxController{
  
  
  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;
  int seleccionado = -1;

  List<Horario> horarios = <Horario>[];
  List<Horario> horariosMostrados = <Horario>[];
  bool cantidaddHorarios = true;
  int cantidad = 20;
  Map materias = {};
  Map maofIdAMateriaId = {};//un mapa en donde se ingresa el id de la materia ofertada por el tutor y se obtiene el id de la materia que se encuentra en la api de la universidad

  var cor = '';
  var rol = '';
  
  @override
  Future<void> onInit() async {
    super.onInit();
    cor = (await MsalService().getCorreo())!; 
    rol = (await MsalService().getRol(cor))!;
    if(rol!='Tutor'){
      MsalService().getCurrentUser();
      if (rol!='Tutor') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
    
    
    loadDatos();
  }


  Future<void> loadDatos()async{
    listAsignatura = [];
    cor = (await MsalService().getCorreo())!; 

    final data = await Horario_api.instace.fetch_horarios_sesion(cor);

    horarios = data!;

    final data2 = await MateriaOferta_api.instace.fetch_materia_por_tutor(cor);
    List<MateriaOferta> mat = data2!;
    for(var i=0; i<mat.length; i++){
      //se busca el nombre de la materia en la api de la u para poder ponerlo en la List de asignaturas
      //la llave del mapa es el nombre de la asignatura y su valor devuelve el id de la materia_oferta
      materias[mat[i].idMateriaApi.toString()] = mat[i].maofId;//antes del igual cambiar por el nombre de la materia 
      maofIdAMateriaId[mat[i].maofId] = mat[i].idMateriaApi;
      listAsignatura.add(mat[i].idMateriaApi.toString());
    }
    asignatura.value = listAsignatura[0];

    if(horarios.length>=cantidad){
      horariosMostrados = horarios.sublist(0,cantidad);
    }else{
      horariosMostrados = horarios;
      cantidaddHorarios = false;
    }

    update();
  }

  modificar(int index, int maofId){
    asignatura.value = obtenerNombreMateria(maofId);
    seleccionado = index;
    update();
  }

  obtenerNombreMateria(int maofId){
    var idMatApi = maofIdAMateriaId[maofId];
    //Buscar el nombre de la materia en la api de la universidad
    String nombre = idMatApi.toString();
    return nombre;
  }

  Future modificarSesion(Horario hor) async {
    int maofId = materias[asignatura.value];

    Horario horario = Horario(horId: hor.horId, horDia: hor.horDia, horHora: hor.horHora, horFehca: hor.horFehca, horTipo: 'Sesion', maofId:maofId, usuId:hor.usuId);

    var json = jsonEncode(horario.toJson());

    final insertar = await Horario_api.instace.update_horario_tutor_sesion(json);


    seleccionado = -1;

    loadDatos();
  }

  agregar(){
    cantidad = cantidad + 20;
    if(horarios.length>=cantidad){
      horariosMostrados = horarios.sublist(0,cantidad);
    }else{
      horariosMostrados = horarios;
      cantidaddHorarios = false;
    }
    update();
  }
  
}