//import 'package:colorviu/models/results.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

// ignore: camel_case_types
class resultsTable extends StatefulWidget {
  const resultsTable({super.key});

  @override
  State<resultsTable> createState() => _resultsTableState();
}

// ignore: camel_case_types
class _resultsTableState extends State<resultsTable> {
  @override
  Widget build(BuildContext context) {
    //final results = Provider.of<List<Results>>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
          },
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(children: [
              Column(children: const [
                SizedBox(
                  height: 10,
                ),
                Text('No.', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
              ]),
              Column(children: const [
                SizedBox(
                  height: 10,
                ),
                Text('Test', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
              ]),
              Column(children: const [
                SizedBox(
                  height: 10,
                ),
                Text('Deficiency', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
              ]),
              Column(children: const [
                SizedBox(
                  height: 10,
                ),
                Text('Severity', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
              ]),
              Column(children: const [
                SizedBox(
                  height: 10,
                ),
                Text('Time', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 10,
                ),
              ]),
            ]),
          ],
        ),
      )
    );
  }
}
