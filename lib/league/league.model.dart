// import 'package:flutter/material.dart';
//引っ張ってくる
//todo リーグを自動で作る
//for(int i = _numberOfParticipants ; i < Participants.length; i++){
//  Row * i (
//  children: <Widget>[
//    Column * i(children: <Widget>[
//的なことをやりたい。
//],);
//  ],
//  );
//}
//Row()
//
//class DataTableWidget extends StatelessWidget {
//
//  List results=[] ;
//  intState((){
//  super.iniState();
//  this.getSale();
//  })
//  Future<String> getData () async {
//
//    var response = await http.get(
//      "$saleUrl/?format=json",
//
//    );
//    setState(() {
//      var dataConvertedToJson =
//      json.decode(utf8.decode(response.bodyBytes));
//      results = dataConvertedToJson['results'];
//    });
//    print('${results.length}');
//    return "successful";
//  }
//  DataRow _getDataRow(result) {
//    return DataRow(
//      cells: <DataCell>[
//        DataCell(Text(data["text1"])),
//        DataCell(Text(data["text2"])),
//        DataCell(Text(data["text3"])),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return DataTable(
//      columns: [
//        DataColumn(label: Text('Patch')),
//        DataColumn(label: Text('Version')),
//        DataColumn(label: Text('Ready')),
//      ],
//      rows: List.generate(
//          results.length, (index) => _getDataRow(results[index])),
//    );
//  }
//}
