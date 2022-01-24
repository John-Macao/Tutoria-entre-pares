import 'package:frontend/data/local_db/horario_api.dart';
import 'package:frontend/data/local_db/materia_oferta_api.dart';
import 'package:frontend/data/local_db/usuario_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/usuario.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

class TutoradoHorarioTutorController extends GetxController{

  List<String> listAsignatura = <String>[];
  RxString asignatura = ''.obs;

  Map<dynamic, dynamic> asignaturasMap = {};

  List<Usuario> listUsuario = <Usuario>[];


  List<String> listLunes = <String>[];
  List<String> listMartes = <String>[];
  List<String> listMiercoles = <String>[];
  List<String> listJueves = <String>[];
  List<String> listViernes = <String>[];


  @override
  Future<void> onInit() async {
    super.onInit();
    var cor = await MsalService().getCorreo(); 
    var rol = await MsalService().getRol(cor);
    if(rol!='Tutorado'){
      MsalService().getCurrentUser();
      if (rol!='Tutorado') {
        js.context.callMethod('redireccion', [MsalService.rol]);
      }
    }

    loadDatos();

  }

  Future loadDatos()async{
    final listMatOferta = (await MateriaOferta_api.instace.fetch_materias_unicas())!;
    
    for(int i=0;i<listMatOferta.length;i++){
      //por cada id_mat_api que haya, buscar en la api el nombre de la materia
      listAsignatura.add(listMatOferta[i].idMateriaApi.toString());
      asignaturasMap[listMatOferta[i].idMateriaApi.toString()] = listMatOferta[i].idMateriaApi;
    }
    asignatura.value = listAsignatura[0];

    buscar();
  }

  Future buscar()async{
    listUsuario = <Usuario>[];
    listLunes = <String>[];
    listMartes = <String>[];
    listMiercoles = <String>[];
    listJueves = <String>[];
    listViernes = <String>[];

    var idMateria = asignaturasMap[asignatura.value];

    final materiasOferta = (await MateriaOferta_api.instace.fetch_materias_por_materia(idMateria))!;

    for(int i=0; i<materiasOferta.length; i++){
      listUsuario.add((await Usuario_api.instace.fetch_usuario_por_id(materiasOferta[i].usuId))!);


      final horarios = (await Horario_api.instace.fetch_horarios_fijo_de_materia_y_usuario(listUsuario[i].usuId, materiasOferta[i].maofId))!;


      listLunes.add('');
      listMartes.add('');
      listMiercoles.add('');
      listJueves.add('');
      listViernes.add('');

      for(int j=0;j<horarios.length;j++){
        switch (horarios[j].horDia) {
          case 'Lunes':
            listLunes[i] = listLunes[i] + horarios[j].horHora + ' -';
            break;
          case 'Martes':
            listMartes[i] = listMartes[i] + horarios[j].horHora + ' -';
            break;
          case 'Miercoles':
            listMiercoles[i] = listMiercoles[i] + horarios[j].horHora + ' -';
            break;
          case 'Jueves':
            listJueves[i] = listJueves[i] + horarios[j].horHora + ' -';
            break;
          case 'Viernes':
            listViernes[i] = listViernes[i] + horarios[j].horHora + ' -';
            break;
          default:
            break;
        }
      }


      update();

    }

  }

  
}