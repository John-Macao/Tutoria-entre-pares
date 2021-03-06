import 'package:flutter/material.dart';

class Menu{

  static Widget getDrawer(BuildContext context) {
    List<Widget> drawerOptions = [];
    drawerOptions.add(
      ListTile(
        title: Text("Principal"),
        leading: Icon(Icons.home_outlined),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-principal");
        },
      )
    );
    drawerOptions.add(
      ListTile(
        title: Text("Nuevo tutor"),
        leading: Icon(Icons.add_circle_outline),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-nuevo-tutor");
          
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text("Quitar Tutor"),
        leading: Icon(Icons.remove_circle_outline),
        
        onTap: () {
          Navigator.pushNamed(context, "/administrador-quitar-tutor");
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text("Asignar/Quitar Materia"),
        leading: Icon(Icons.article_outlined),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-materia");
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text("Reporte Tutorias"),
        leading: Icon(Icons.analytics_outlined),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-reporte-tutorias");
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text("Reporte Tutorados"),
        leading: Icon(Icons.analytics_outlined),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-reporte-tutorados");
        },
      ),
    );
    drawerOptions.add(
      ListTile(
        title: Text("Filtrar Estudiantes"),
        leading: Icon(Icons.filter_alt_outlined),
        onTap: () {
          Navigator.pushNamed(context, "/administrador-filtro-estudiantes");
          
        },
      )
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