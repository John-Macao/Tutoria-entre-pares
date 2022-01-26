
import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class MateriaController extends GetxController{

  String nombre = "";
  String carrera = "";
  String correoTutor = "";
  var cedula = TextEditingController();
  var calificacion = TextEditingController();
  var materias = TextEditingController();


  List<String> listMateriasOfertadas = [];
  List<String> listMateriasPosibles = [];
  Map materiasOfertadas = {};
  Map materiasPosibles = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Administrador'){
      MsalService().getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  Future buscar()async{
    final tutor = await Usuario_api.instace.fetch_usuario_por_cedula(cedula.text);
    nombre = tutor!.usuNomrbe;
    carrera = tutor.usuCarrera;
    correoTutor = tutor.usuCorreo;


    final listMaOf = (await MateriaOferta_api.instace.fetch_materia_por_tutor(tutor.usuCorreo))!;
    listMateriasOfertadas = [];
    for(int i=0;i<listMaOf.length;i++){
      //aqui se busca el nombre de las materias en la api de la u
      listMateriasOfertadas.add(listMaOf[i].idMateriaApi.toString());
      
      //la llave del mapa es el nombre de la asignatura y su valor devuelve el id de la materia de la api
      materiasOfertadas[listMaOf[i].idMateriaApi.toString()] = listMaOf[i].idMateriaApi;//antes del igual cambiar por el nombre de la materia 
    }

    update();
  }
  
  Future deshabilitar(String materiaNombre)async{
    int idMateria = materiasOfertadas[materiaNombre];

    final cambio = await MateriaOferta_api.instace.update_deshabilitar_materia(correoTutor,idMateria);

    buscar();
  }


  buscarMaterias(){
    //CUANDO SE INGRESA LA CALIFICACION MINIMA, SE DEBE BUSCAR EN LA API DE LA U, LAS MATERIAS QUE CORRESPONDAN, DE AHI
    //SE OBTIENE EL NOMBRE Y EL ID DE LA MATERIA, ESTO NO SE PUEDE HACER HASTA TENER LA API
    //DE AHI HACER UN MAPA PARA RELACIONAR EL NOMBRE DE LA MATERIA CON EL ID DE LA MATERIA, PARA ASI, CUANDO SE QUIERA AGREGAR ESA MATERIA A UN TUTOR, SE PUEDA BUSCAR EL ID
    //VERIFICAR SI UNA MATERIA QUE SE QUIERE AGREGAR YA EXISTE EN LA BASE Y ESTA DESHABILITADA, SINO, SE CREA LA NUEVA MATERIA OFERTADA Y ACTUALIZAR LOS DATOS
    //(VERIFICAR LA CALIFICACION MINIMA)

    //datos creador poque no hay conexion con la api aun
    listMateriasPosibles.add('622');
    materiasPosibles['622']=622;
    listMateriasPosibles.add('444');
    materiasPosibles['444']=444;


    update();
  }

  Future agregarMateria(String nombre)async{
    int idMateriaApi = materiasPosibles[nombre];

    final agregacion = await MateriaOferta_api.instace.put_materia_oferta(correoTutor, idMateriaApi);

    buscar();

  }



}