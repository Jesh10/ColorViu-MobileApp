import 'package:colorviu/models/user.dart';
import 'package:colorviu/results/retrieveResults.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/cdt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ColorUser>?>.value(
        value: DatabaseService(uid: '').users,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: const Text('Colorviu'),
            backgroundColor: Colors.brown[400],
            elevation: 0,
            actions: [
              ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                    //Navigator.pop(context);
                  }),
              // TextButton.icon(
              //   onPressed: () => _showSettingsPanel(),
              //   icon: Icon(Icons.settings),
              //   label: Text('settings'))
            ],
          ),
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CDT()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text('COLOR DEFICIENCY TEST (CDT)'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => retrieveResults()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text('CDT RESULTS'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 12.0,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text('MORE INFORMATION'),
                ),
                //screens[index]
              ]),
        ));
  }
}
