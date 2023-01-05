import 'package:colorviu/models/results.dart';
import 'package:colorviu/results/resultsList.dart';
import 'package:colorviu/results/resultsTable.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class retrieveResults extends StatelessWidget {
  
  retrieveResults({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Results>>.value(
      //catchError: (_, __) => null,
      value: DatabaseService(uid: '').resultsData,
      initialData: [],
      child: Scaffold(
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
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 55),
        //   child: Text(
        //     getCurrentDate() + 'Results',
        //     textAlign: TextAlign.center,
        //     style: const TextStyle(fontSize: 50),
        //   ),
        // ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: resultsList(),
        ),
      ),
    );
  }
}
