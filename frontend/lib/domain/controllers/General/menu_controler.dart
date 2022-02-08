import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data/local_db/menu_api.dart';
import 'package:frontend/domain/controllers/General/msla_service.dart';
import 'package:frontend/domain/models/menu.dart';
import 'package:frontend/domain/repository/menu_repository.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:get/get.dart';


class MenuController extends GetxController{
  
  final MenuRepository _menuRepository;
  final UsuarioRepository _usuarioRepository;

  static List<Menu> menus = [];
  //Menu? usu;
  
  List<Widget> drawerOptions = [];

  BuildContext? context;

  MenuController(BuildContext context, this._menuRepository, this._usuarioRepository){
    this.context = context;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadMenu();
  }

  actualizar(){
    update(['menus']);
  }

  Future<void> loadMenu() async {
    final data = await _menuRepository.fetch_menu(MsalService.correo);
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
        List<Menu>? menusHijos = await _menuRepository.fetch_menu_hijos(menu.menid);
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

    drawerOptions.add(
      new ListTile(
        title: Text('Cerrar Sesión'),
        leading: Icon(IconData(int.parse('0xe3b3'), fontFamily: 'MaterialIcons')),
        onTap: (){
          MsalService(_usuarioRepository).logout(context!);
        },
      )
    );
    
    update();
  }

}