
import 'package:flutter/cupertino.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/repository/materia_oferta_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class MateriaController extends GetxController{

  final MateriaOfertaRepository _materiaOfertaRepository;
  final UsuarioRepository _usuarioRepository;

  var nombre = TextEditingController();
  var carrera = TextEditingController();
  var correoTutor = TextEditingController();

  var cedula = TextEditingController();
  var calificacion = TextEditingController();
  var materias = TextEditingController();

  bool _comprobar = false;
  bool get comprobar => _comprobar;

  bool _ver = true;
  bool get ver => _ver;

  bool _ver2 = true;
  bool get ver2 => _ver2;

  RxList<String> listMateriasOfertadas = [''].obs;
  RxList<String> listMateriasPosibles = [''].obs;
  Map materiasOfertadas = {};
  Map materiasPosibles = {};

  MateriaController(this._materiaOfertaRepository, this._usuarioRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService(_usuarioRepository).getCorreo(); 
    var rol = await MsalService(_usuarioRepository).getRol(cor);
    if(rol!='Administrador'){
      MsalService(_usuarioRepository).getCurrentUser();
      if (rol!='Administrador') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }
  }

  Future buscar()async{
    final tutor = await _usuarioRepository.fetch_usuario_por_cedula(cedula.text);
    nombre.text = tutor!.usuNomrbe;
    carrera.text = tutor.usuCarrera;
    correoTutor.text = tutor.usuCorreo;

    listMateriasOfertadas.clear();

    final listMaOf = (await _materiaOfertaRepository.fetch_materia_por_tutor(tutor.usuCorreo))!;
    //listMateriasOfertadas = [''].obs;
    for(int i=0;i<listMaOf.length;i++){
      //aqui se busca el nombre de las materias en la api de la u
      listMateriasOfertadas.add(listMaOf[i].idMateriaApi.toString());
      
      //la llave del mapa es el nombre de la asignatura y su valor devuelve el id de la materia de la api
      materiasOfertadas[listMaOf[i].idMateriaApi.toString()] = listMaOf[i].idMateriaApi;//antes del igual cambiar por el nombre de la materia 
    }

    this._comprobar = true;
    this._ver = false;

    
    update();
    update(['listaMateriaOfertadasUpdate']);

  }
  
  Future deshabilitar(String materiaNombre)async{
    int idMateria = materiasOfertadas[materiaNombre];
    print("-----------------------------------------------##");
    print(idMateria);
    final cambio = await _materiaOfertaRepository.update_deshabilitar_materia(correoTutor.text ,idMateria);

    buscar();
  }


  buscarMaterias(){
    listMateriasPosibles.clear();
    //CUANDO SE INGRESA LA CALIFICACION MINIMA, SE DEBE BUSCAR EN LA API DE LA U, LAS MATERIAS QUE CORRESPONDAN, DE AHI
    //SE OBTIENE EL NOMBRE Y EL ID DE LA MATERIA, ESTO NO SE PUEDE HACER HASTA TENER LA API
    //DE AHI HACER UN MAPA PARA RELACIONAR EL NOMBRE DE LA MATERIA CON EL ID DE LA MATERIA, PARA ASI, CUANDO SE QUIERA AGREGAR ESA MATERIA A UN TUTOR, SE PUEDA BUSCAR EL ID
    //VERIFICAR SI UNA MATERIA QUE SE QUIERE AGREGAR YA EXISTE EN LA BASE Y ESTA DESHABILITADA, SINO, SE CREA LA NUEVA MATERIA OFERTADA Y ACTUALIZAR LOS DATOS
    //(VERIFICAR LA CALIFICACION MINIMA)

    //datos creador poque no hay conexion con la api aun
    
    listMateriasPosibles.add('16');
    materiasPosibles['16']=16;
    listMateriasPosibles.add('17');
    materiasPosibles['17']=17;

    this._ver2 = false;
    update();
    update(['listaMateriaPosiblesUpdate']);
  }

  Future agregarMateria(String nombre2)async{
    print("VERRRRRRRRRR");
    print(nombre2);
    //String vv = '16';
    print(materiasPosibles[nombre2]);

    int idMateriaApi = materiasPosibles[nombre2];

    print(correoTutor.text);
    

    final agregacion = await _materiaOfertaRepository.put_materia_oferta(correoTutor.text, idMateriaApi);

    buscar();

  }



}