import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_reporte_tutorias_controller.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class VistaReporteTutorias extends StatelessWidget {
  const VistaReporteTutorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reporte Tutorias"),
      ),
      drawer: WebViewAware(child: Menu.getDrawer(context)),
      body: const WebViewAware(child: reporteTutorias()),
    );
  }
}

class reporteTutorias extends StatelessWidget {
  const reporteTutorias({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return GetBuilder<ReporteTutoriasController>(
      init: ReporteTutoriasController(),
      builder: (_){
        return Center(
          child: Column(
            children: [
              WebViewX(
                initialContent: _.reporte_tutorias ,
                initialSourceType: SourceType.url,
                width: queryData.size.width, 
                height: queryData.size.height-80,
                onWebViewCreated: (controller) => _.webViewXController = controller,
                ),
            ],
          ),
        );
        
      },
      
    );
  }
}

