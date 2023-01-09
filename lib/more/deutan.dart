import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class Deutan extends StatelessWidget {
  Deutan({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Deutan Deficiency'),
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
                'What Is Deutan?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 122, 120, 120)),
              SizedBox(height: 5),
              Image(
                image: AssetImage("assets/i_4.png"),
                width: 270,
              ),
              SizedBox(height: 10),
              Text(
                "Deutan is very similar to the Protan Color Deficiency. Thus, it is also a hereditary red-green color deficiency and it is also a dichromacy condition where only two cones in the person's eyes are functional \n \n" 
                'There are also two types of Deutan Color Deficiencies, Deuteranomaly and Deuteranopia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Deuteranomaly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Deuteranomaly is a partially severe color deficiency \n \n' 
                'The Color Blind person who has this condition is unable to distinguish the difference between the colors Red and Green \n \n'
                "However, this condition is only partially severe as the green cones in the person's eyes are present, but but they have abnormalitites which makes the person perceive Green as more Red",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Deuteranopia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Deuteranopia is a severe color deficiency \n \n'
                'The Color Blind person who has this condition is also unable to distinguish the difference between the colors Red and Green \n \n'
                "However, this condition is severe as the person's eyes are missing the green cones completely, leaving only the cones that absorb Blue and Green light",
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