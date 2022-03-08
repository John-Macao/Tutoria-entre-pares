import 'package:flutter/material.dart';
import 'package:frontend/dependencies/di.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_reporte_tutorados_controller.dart';
import 'package:frontend/domain/repository/usuario_repository.dart';
import 'package:frontend/util/style.dart';
import 'package:frontend/views/General/menu_view.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class VistaReporteTutorados extends StatelessWidget {
  const VistaReporteTutorados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimario,
        title: Container( alignment: Alignment.center, child: Text("Reporte Tutorados", style: TextStyle(fontSize: 23),)),
      ),
      
      drawer: WebViewAware(child: MenuView.getDrawer(context)),
      //drawer: Menu.getDrawer(context),
      body:reporteTutorados(),
    );
  }
}

class reporteTutorados extends StatelessWidget {
  const reporteTutorados({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return GetBuilder<ReporteTutoradosController>(
      init: ReporteTutoradosController(locator.get<UsuarioRepository>()),
      builder: (_){
        return Center(
          child: Column(
            children: <Widget> [
              WebViewX(
                initialContent: _.reporteTutorados,
                initialSourceType: SourceType.urlBypass,
                height: queryData.size.height-80, 
                width: queryData.size.width,
                onWebViewCreated: (controller) => _.webViewXController = controller,
              )

            ],
          ),
        );
      },
      
    );
  }
}