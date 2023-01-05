import 'package:colorviu/models/user.dart';
import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final AuthService _auth = AuthService();

late String userid;

class retrieveResults extends StatefulWidget {
  const retrieveResults({super.key});

  @override
  State<retrieveResults> createState() => _retrieveResultsState();
}

getCurrentDate() {
  return DateFormat('dd-MM-yyyy').format(DateTime.now());
}

class _retrieveResultsState extends State<retrieveResults> {
  @override
  Widget build(BuildContext context) {
    final uid = Provider.of<MyUser>(context);
    userid = uid.uid;
    
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text(
          'CDT Results',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: [
          ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              }),
          // TextButton.icon(
          //   onPressed: () => _showSettingsPanel(),
          //   icon: Icon(Icons.settings),
          //   label: Text('settings'))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      getCurrentDate() + 'Results',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 50),
                    ),
                    const SizedBox(height: 20),
                  ],
                )),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ))
          ],
        ),
      ),
    );
  }
}
