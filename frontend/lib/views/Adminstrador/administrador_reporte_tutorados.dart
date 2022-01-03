import 'package:flutter/material.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_menu_controller.dart';
import 'package:frontend/domain/controllers/Administrador/administrador_reporte_tutorados_controller.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class VistaReporteTutorados extends StatelessWidget {
  const VistaReporteTutorados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Reporte Tutorados"),
      ),
      drawer: WebViewAware(child: Menu.getDrawer(context)),
      body: const WebViewAware(child: reporteTutorados()),
    );
  }
}

class reporteTutorados extends StatelessWidget {
  const reporteTutorados({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return GetBuilder<ReporteTutoradosController>(
      init: ReporteTutoradosController(),
      builder: (_){
        return Center(
          child: Column(
            children: <Widget> [
              WebViewX(
                initialContent: _.reporte_tutorados,
                initialSourceType: SourceType.url,
                width: queryData.size.width, 
                height: queryData.size.height-80 ,
                onWebViewCreated: (controller) => _.webViewXController= controller
                ),
            ],
          ),
        );
      },
    );
  }

}