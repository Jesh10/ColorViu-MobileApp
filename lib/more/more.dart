import 'package:colorviu/more/about.dart';
import 'package:colorviu/more/deutan.dart';
import 'package:colorviu/more/protan.dart';
import 'package:colorviu/more/tips.dart';
import 'package:colorviu/more/tritan.dart';
import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

final AuthService _auth = AuthService();

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('More Information'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          ElevatedButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Protan()),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ListTile(
                            title: const Text(
                              'Protan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50
                              ),
                            ),
                            subtitle: Text(
                              'Very Common Color Deficiency',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Image(
                            image: AssetImage('assets/i_8.png'),
                            width: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:16, horizontal: 40),
                            child: Text(
                              'A common Color Deficiency among Color blind people who have difficulties percieving the color Red well',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Deutan()),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        ListTile(
                          title: const Text(
                            'Deutan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50
                            ),
                          ),
                          subtitle: Text(
                            'Very Common Color Deficiency',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Image(
                          image: AssetImage('assets/i_1.png'),
                          width: 300,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:16, horizontal: 40),
                            child: Text(
                              'Similar to the Protan Deficiency, but these Color Blind people have difficulties percieving the color Green well',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tritan()),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ListTile(
                            title: const Text(
                              'Tritan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50
                              ),
                            ),
                            subtitle: Text(
                              'Very Rare Color Deficiency',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Image(
                            image: AssetImage('assets/i_9.png'),
                            width: 300,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:16, horizontal: 40),
                            child: Text(
                              'A very rare Color Deficiency among Color blind people who have difficulties percieving the colors Blue well',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tips()),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ListTile(
                            title: const Text(
                              'Color Vision Tips',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 45
                              ),
                            ),
                            subtitle: Text(
                              'How to maintain your Color Vision',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 18
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Image(
                            image: AssetImage('assets/i_14.png'),
                            width: 300,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          ListTile(
                            title: const Text(
                              'About',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50
                              ),
                            ),
                            subtitle: Text(
                              'What is ColorViu?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(image: AssetImage('assets/color-eye.jpg')),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 15),
              ],
            )
          ),
        ),
    );
  }
}
