import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorMenu{

  static Widget getDrawer(BuildContext context) {
    List<Widget> drawerOptions = [];
    drawerOptions.add(
      ListTile(
        title: Text('Generar Sesión Tutorial'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-generar-sesion');
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text('Modificar Sesión Tutorial'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-listar-sesiones');
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text('Registrar Horario de Tutoría'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-generar-tutoria');
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text('Modificar Horario de Tutoría'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-modificar-tutoria');
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text('Modificar Telefono'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-modificar-telefono');
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text('Coordinación'),
        onTap: (){
          Navigator.pushNamed(context, '/tutor-coordinacion');
        },
      ),
    );


    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(""), accountEmail: Text("")),
          Column(children: drawerOptions)
        ],
      ),
    );
  }
}
