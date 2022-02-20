import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/General/menu_controler.dart';
import 'package:frontend/domain/repository/menu_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:get/get.dart';

class MenuView{

  static Widget getDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigo[50],
      child: Column(
        children: <Widget>[
          SizedBox(height: 200.0, 
          child: Container(
            child: Image.asset("imagenes/img-asu.png", width: 400, height: 200 ),
            color: colorPrimario,
            )
          ),
          
          GetBuilder<MenuController>(
            init: MenuController(context, locator.get<MenuRepository>(), locator.get<UsuarioRepository>()),
            builder: (_){
              return Column(children: _.drawerOptions,);
            }
          ),
        ],
      ),
    );
  }
}


