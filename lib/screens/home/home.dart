import 'package:colorviu/models/user.dart';
import 'package:colorviu/screens/results/retrieveResults.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/cdt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    // void _showSettingsPanel() {
    //   showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return Container(
    //           //value: null,
    //           child: Container(
    //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
    //         child: SettingsForm(),
    //       ));
    //     }
    //   );
    // }

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
                    MaterialPageRoute(builder: (context) => retrieveResults()),
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
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/_DSC0034.jpg'),
              //     fit: BoxFit.cover,
              //     ),
              // ),
              // child: UserList(),
            ]),
      ),
    );
  }
}
