import 'package:flutter/material.dart';

class BattleTable extends StatelessWidget {
  const BattleTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder.all(color: Colors.white),
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(1.0),
          2: FixedColumnWidth(100.0),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        children: [
          TableRow(children: [
            Text("1"),
            Text("2"),
            Text("3"),
          ]),
          TableRow(children: [
            Container(
              child: const Text("4"),
              margin: EdgeInsets.all(10.0),
              width: 50.0,
              height: 100.0,
              color: Colors.lightGreen,
            ),
            Container(
              child: const Text("5"),
              color: Colors.amberAccent,
            ),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.bottom,
                child: Container(
                  child: const Text("6"),
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 60,
                  color: Colors.orange,
                ))
          ]),
          TableRow(
              decoration: const BoxDecoration(color: Colors.grey),
              children: [
                Center(
                  child: Container(
                    child: Text(
                      "7",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    width: 30,
                    height: 100,
                    color: Colors.pinkAccent,
                  ),
                ),
                Container(
                  child: Text("8\n8"),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
