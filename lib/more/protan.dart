import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class Protan extends StatelessWidget {
  Protan({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Protan Deficiency'),
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
                'What Is Protan?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 122, 120, 120)),
              SizedBox(height: 5),
              Image(
                image: AssetImage("assets/i_6.png"),
                width: 270,
              ),
              SizedBox(height: 10),
              Text(
                'Protan is a hereditary red-green color deficiency which affects around 8% of men and 0.5% of women. It dorminantly affects men because this deficiency is carried on the X chromosome. \n \n' 
                'There are two types of Protan Color Deficiencies, Protanomaly and Protanopia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Protanomaly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Protanomaly is a partially severe color deficiency \n \n' 
                'The Color Blind person who has this condition is unable to distinguish the difference between the colors Red and Green \n \n'
                "However, this condition is only partially severe as the red cones in the person's eyes are present, but they have abnormalitites which makes the person perceive Red as more Green",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Protanopia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Protanopia is a severe color deficiency \n \n'
                'The Color Blind person who has this condition is also unable to distinguish the difference between the colors Red and Green \n \n'
                "However, this condition is severe as the person's eyes are missing the red cones completely, leaving only the cones that absorb Blue and Green light",
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