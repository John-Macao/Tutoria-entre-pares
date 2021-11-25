import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorMenu extends StatelessWidget{
  const TutorMenu({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TextButton(onPressed: (){
              //Navigator.pushNamed(context, '/generar-sesion-tutorial');
            }, 
            child: Text('Generar Sesión Tutorial')
          ),
          TextButton(onPressed: (){
              //Navigator.pushNamed(context, '/modificar-sesion-tutorial');
            }, 
            child: Text('Modificar Sesión Tutorial')
          ),
          TextButton(onPressed: (){
              Navigator.pushNamed(context, '/tutor-generar-tutoria');
            }, 
            child: Text('Registrar Horario de Tutoría')
          ),
          TextButton(onPressed: (){
              //Navigator.pushNamed(context, '/modificar-horario-tutoria');
            }, 
            child: Text('Modificar Horario de Tutoría')
          ),
          TextButton(onPressed: (){
              Navigator.pushNamed(context, '/tutor-modificar-telefono');
            }, 
            child: Text('Modificar Telefono')
          ),
          TextButton(onPressed: (){
              //Navigator.pushNamed(context, '/tutor');
            }, 
            child: Text('Coordinacion')
          ),
        ],
      ),
    );
  }
}