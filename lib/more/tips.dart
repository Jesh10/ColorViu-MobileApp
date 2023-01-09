import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  Tips({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Color Vision Tips'),
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover),
            ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // ignore: prefer_const_literals_to_create_immutables
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: const [
              SizedBox(height: 15),
              Text(
                'What Is Color Vision?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 122, 120, 120)),
              SizedBox(height: 10),
              Image(
                image: AssetImage("assets/graph.webp"),
                width: 350,
              ),
              SizedBox(height: 15),
              Text(
                "The ability to distinguish between light that is constituted of different wavelengths (i.e., different spectral power distributions) regardless of light intensity \n \n"
                'The process starts with the differential stimulation of several types of photoreceptors called cones by light entering the eye \n \n'
                'These cones then provide outputs that eventually reach the brain after travelling through numerous layers of neurons',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Color Vision Problem In Japan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'There are issues with color vision in Japanese society as a whole, Japanese physicians, and Japanese ophthalmologists because they lack awareness of color vision in general',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Color Vision Tips',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. Book appointments with Eye Doctors to diagnose your condition \n \n'
                '2. Have regular visits to your healthcare provider \n \n'
                "3. Keep a healthy lifestyle (ie., Exercise, Good Diet)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
            ]),
          ),
        )
      ),
    );
  }
}