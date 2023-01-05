import 'package:colorviu/models/user.dart';
import 'package:colorviu/results/retrieveResults.dart';
import 'package:colorviu/screens/home/navigation.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/cdt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int index = 0;
  final screens = [
    Navigation(),
    CDT(),
    retrieveResults(),
  ];
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
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home), 
            label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.visibility_outlined),
            selectedIcon: Icon(Icons.visibility), 
            label: 'Tests'),
          NavigationDestination(
            icon: Icon(Icons.all_inbox_outlined), 
            selectedIcon: Icon(Icons.all_inbox),
            label: 'Results'),
        ]),
    );
  }
}
