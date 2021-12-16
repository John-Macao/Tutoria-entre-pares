
import 'package:flutter/material.dart';
import 'package:frontend/data/remote/http/prueba_servicio.dart';
import 'package:frontend/domain/models/modelo_prueba.dart';

class DataSource extends DataTableSource {
  DataSource(List<Prueba> test2)  {
    //print("ver TTTTTTT ");
    //print(test);
    //print(test.length);

    ver(test2);
    print("entra data source");
    cargaTest();
  }

  List<Prueba> _test = [];
  List<Prueba> get test => _test;

  ver(List<Prueba> t){
    _test = t;
  }



  Future<void> cargaTest() async {
    final data = await PruebaServicio.instace.obtener();
    this._test = data!;
    print("se ejecuta este METODO");
  }
  

  @override
  DataRow? getRow(int index){
    print("VER 1");
    print(_test);
    print(test);
    final Prueba t = _test[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(t.id.toString())),
        DataCell(Text(t.title)),
        DataCell(Text(t.body)),
      ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => test.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

}
