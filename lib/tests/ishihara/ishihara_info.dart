import 'package:colorviu/services/auth.dart';
import 'package:colorviu/tests/ishihara/ishihara_test.dart';
import 'package:flutter/material.dart';

class InfoIshihara extends StatefulWidget {
  const InfoIshihara({super.key});

  @override
  State<InfoIshihara> createState() => _InfoIshiharaState();
}

final AuthService _auth = AuthService();

class _InfoIshiharaState extends State<InfoIshihara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text(
          'Ishihara Test',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical:10, horizontal: 20),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: const Text(
              'How This Test Works',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              'You will be required to interpret the various numbers shown in the pseudoisochromatic plates. \n \n' 
              'If you are unsure about the number within the test plate input in your best guess.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical:10, horizontal: 20),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: const Text(
              'Before Taking the Test',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              '1. Remove any glasses with colored lenses', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:20),
            child: const Text(
              '2. Turn up your screen brightness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              '3. The color blind test plates forms a one digit number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[300]!),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ishihara()),
                  );
              }, 
              child: const Text(
                'Proceed',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          ),
          const SizedBox(height: 30),
        ]),
      )),
    );
  }
}