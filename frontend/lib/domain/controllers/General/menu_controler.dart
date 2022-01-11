import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/local_db/menu_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/menu.dart';
import 'package:get/get.dart';


class MenuController extends GetxController{
  

  static List<Menu> menus = [];
  //Menu? usu;
  
  List<Widget> drawerOptions = [];

  BuildContext? context;

  MenuController(BuildContext context){
    this.context = context;
  }

  @override
  void onInit() {
    super.onInit();
    print("Igual a initState menu");
  }

  @override
  void onReady() {
    super.onReady();
    print("igual a onReady menu");
    print(menus.length);
    this.loadMenu();
  }

  actualizar(){
    update(['menus']);
  }

  Future<void> loadMenu() async {
    
    //print('El correo ess: ' + CorreoController.correo.text);
    final data = await Menu_api.instace.fetch_menu(MsalService.correo);
    menus = data!;
    for (var i = 0; i < MenuController.menus.length; i++) {
      var menu = MenuController.menus[i];
      if(menu.mentipo=='U'){
          drawerOptions.add(
          new ListTile(
            title: Text(menu.mendescripcion),
            leading: Icon(IconData(int.parse(menu.menicono), fontFamily: 'MaterialIcons')),
            onTap: (){
              Navigator.pushNamed(this.context!, menu.menurl);
            },
          )
        );
      }else if(menu.mentipo=='P'){
        List<Widget> drawerHijos = [];
        List<Menu>? menusHijos = await Menu_api.instace.fetch_menu_hijos(menu.menid);
        for (var j = 0; j < menusHijos!.length; j++) {
          drawerHijos.add(
            new ListTile(
              title: Text(menusHijos[j].mendescripcion),
              leading: Icon(IconData(int.parse(menusHijos[j].menicono), fontFamily: 'MaterialIcons')),
              onTap: (){
                Navigator.pushNamed(this.context!, menusHijos[j].menurl);
              },
            )
          );
        }
        drawerOptions.add(
          new ExpansionTile(
            title: Text(menu.mendescripcion),
            leading: Icon(IconData(int.parse(menu.menicono), fontFamily: 'MaterialIcons')),
            children: drawerHijos,
          )
        );
      }
      
    }
    
    update();
  }

}