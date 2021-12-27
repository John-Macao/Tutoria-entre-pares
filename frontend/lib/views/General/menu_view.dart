import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/General/menu_controler.dart';
import 'package:get/get.dart';

class MenuView{

  static Widget getDrawer(BuildContext context) {
    
    

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(""), accountEmail: Text("")),
          GetBuilder<MenuController>(
            init: MenuController(context),
            builder: (_){
              return Column(children: _.drawerOptions,);
            }
          ),
        ],
      ),
    );
  }
}


