
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/Controlador/Administrador/test_controller.dart';
import 'package:get/get.dart';


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Test API"),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          height: 600,
          width: (queryData.size.width/1.1),
          child: tabla(),
        ),
      )
    );
  }
}

class tabla extends StatelessWidget {
  const tabla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (_){
        return Column(
          children: [
            InkWell(
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text("Uno ")),
                  DataColumn(label: Text("Dos ")),
                ], 
                rows: rows) ,
            )
          ],
        )
      },
    );
  }
}