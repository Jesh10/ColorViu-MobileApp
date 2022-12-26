import 'package:colorviu/models/user.dart';
import 'package:colorviu/screens/home/settings_form.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:colorviu/screens/home/user_list.dart';

class Display extends StatelessWidget {
  final AuthService _auth = AuthService();

  Display({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              //value: null,
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: SettingsForm(),
          ));
        }
      );
    }

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
                }),
            TextButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: const Icon(Icons.settings),
                label: const Text('settings'))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/_DSC0034.jpg'),
              fit: BoxFit.cover,
              ),
          ),
          child: const UserList(),
        ),
      ),
    );
  }
}
