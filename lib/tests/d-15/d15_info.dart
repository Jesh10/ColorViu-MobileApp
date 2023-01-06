import 'package:colorviu/services/auth.dart';
import 'package:colorviu/tests/d-15/d15_test.dart';
import 'package:flutter/material.dart';

class InfoD15 extends StatefulWidget {
  const InfoD15({super.key});

  @override
  State<InfoD15> createState() => _InfoD15State();
}

final AuthService _auth = AuthService();

class _InfoD15State extends State<InfoD15> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('D-15 Arrangement'),
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
            margin: const EdgeInsets.all(15.0),
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
            margin: const EdgeInsets.symmetric(vertical:20, horizontal: 20),
            child: const Text(
              'You will be shown a row of colored boxes which have to be arranged in the correct order. \n \n' 
              'The colored boxes on the extreme left and right sides of the row has been done for you as a reference. \n \n'
              'Based on the the order of the colored boxes, the type of your color blindness and as well its severity can be calculated.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25
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
            margin: const EdgeInsets.all(20),
            child: const Text(
              '1. Remove any glasses with colored lenses', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:20),
            child: const Text(
              '2. Turn up your screen brightness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                    MaterialPageRoute(builder: (context) => const D15()),
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
          const SizedBox(height: 40),
        ]),
      )),
    );
  }
}