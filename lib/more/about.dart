import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('About ColorViu'),
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
                'What Is ColorViu?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 5),
              Divider(color: Color.fromARGB(255, 122, 120, 120)),
              SizedBox(height: 10),
              Image(
                image: AssetImage("assets/colorviu.jpg"),
                width: 350,
              ),
              SizedBox(height: 15),
              Text(
                "ColorViu is a Color Vision Testing platform that has the vision to improve the lives of anyone with Color Deficiencies \n \n"
                'Those who might not know if they are Color Deficient can use our easy-to-do Color Vision Tests (ie., Ishihara & D-15) to find out \n \n'
                'ColorViu also provides users with a Results page to view their completed Tests \n \n',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Contact Us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  decoration: TextDecoration.underline
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email: jeshcolorviu@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 60),
            ]),
          ),
        )
      ),
    );
  }
}