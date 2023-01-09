import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class Tritan extends StatelessWidget {
  Tritan({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Tritan Deficiency'),
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
                'What Is Tritan?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 122, 120, 120)),
              SizedBox(height: 5),
              Image(
                image: AssetImage("assets/i_11.png"),
                width: 270,
              ),
              SizedBox(height: 10),
              Text(
                "Unlike the other two Color Deficiencies, Tritan is a hereditary blue-yellow color deficiency but, it is also a dichromacy condition where only two cones in the person's eyes are functional \n \n"
                'There are also two types of Tritan Color Deficiencies, Tritanomaly and Tritanopia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Tritanomaly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tritanomaly is a partially severe color deficiency \n \n' 
                'The Color Blind person who has this condition is unable to distinguish the difference between the colors Blue and Yellow \n \n'
                "However, this condition is only partially severe as the blue cones in the person's eyes are present, but they have abnormalitites which makes the person perceive the world in more Red, Black and White",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Tritanopia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tritanopia is a severe color deficiency \n \n'
                'The Color Blind person who has this condition is also unable to distinguish the difference between the colors Blue and Yellow \n \n'
                "However, this condition is severe as the person's eyes are missing the blue cones completely, leaving only the cones that absorb Red and Green light",
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