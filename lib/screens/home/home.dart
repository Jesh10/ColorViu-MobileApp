import 'package:colorviu/results/retrieveResults.dart';
//import 'package:colorviu/services/auth.dart';
import 'package:colorviu/tests/cdt.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final AuthService _auth = AuthService();
  int index = 0;
  final screens = [
    CDT(),
    retrieveResults(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        backgroundColor: Colors.grey[50],
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        // ignore: prefer_const_literals_to_create_immutables
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home), 
            label: 'Home'),
          
          const NavigationDestination(
            icon: Icon(Icons.all_inbox_outlined), 
            selectedIcon: Icon(Icons.all_inbox),
            label: 'Results'),
          
          const NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info), 
            label: 'More'),
        ]),
    );
  }
}
