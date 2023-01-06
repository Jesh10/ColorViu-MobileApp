import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class MoreIshihara extends StatefulWidget {
  const MoreIshihara({super.key});

  @override
  State<MoreIshihara> createState() => _MoreIshiharaState();
}

final AuthService _auth = AuthService();

class _MoreIshiharaState extends State<MoreIshihara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Ishihara Test'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          const SizedBox(height: 10),
          const Text(
            'What this Test is About',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45,
            ),
          ),
          const Divider(color: null),
          const Image(
            image: AssetImage("assets/ishihara.jpeg"),
          ),
          const SizedBox(height: 20),
          
        ]),
      )),
    );
  }
}