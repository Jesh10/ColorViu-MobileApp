import 'package:colorviu/models/user.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/d-15/d15_info.dart';
import 'package:colorviu/tests/ishihara/ishihara_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CDT extends StatelessWidget {

  final AuthService _auth = AuthService();

  CDT({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ColorUser>?>.value(
      value: DatabaseService(uid: '').users,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text(
            'ColorViu',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                }),
            // TextButton.icon(
            //   onPressed: () => _showSettingsPanel(),
            //   icon: Icon(Icons.settings),
            //   label: Text('settings'))
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
                        MaterialPageRoute(builder: (context) => const InfoIshihara()),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const ListTile(
                            title: Text(
                              'Ishihara Test',
                              style: TextStyle(
                                fontSize: 35
                              ),
                            ),
                            // subtitle: Text(
                            //   '5 mins',
                            //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            // ),
                          ),
                          const SizedBox(height: 10),
                          const Image(image: AssetImage('assets/ishihara.jpeg')),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'The Ishihara Test is the most well known color blindness test all around the world. \n \n' 
                              'Ishihara was a Japanese ophthalmologist who established the Ishihara Color Vision Test to detect colour blindness in 1917.',
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
                      MaterialPageRoute(builder: (context) => const InfoD15()),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const ListTile(
                          title: Text(
                            'D-15 Arrangement Test',
                            style: TextStyle(
                              fontSize: 30
                            ),
                          ),
                          // subtitle: Text(
                          //   '5 mins',
                          //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          // ),
                        ),
                        const SizedBox(height: 15),
                        const Image(image: AssetImage('assets/d15card.jpg')),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'The D15 set is a modification of the well-known Farnsworth Munsell 100 Hue Test. \n \n'
                              'Each D15 set contains a reference disc and fifteen numbered discs, which make up an incomplete color circle.',
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
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
      )
    );
  }
}