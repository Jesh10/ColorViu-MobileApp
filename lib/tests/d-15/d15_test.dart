import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorviu/models/coordinates.dart';
import 'package:colorviu/models/pointers.dart';
import 'package:colorviu/models/user.dart';
import 'package:colorviu/services/auth.dart';
import 'package:colorviu/services/database.dart';
import 'package:colorviu/tests/d-15/save-button.dart';
import 'package:colorviu/tests/d-15/submit_button.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final AuthService _auth = AuthService();
List indexList = [];
List entriesX = [];
List entriesY = [];

class D15 extends StatefulWidget {
  const D15({super.key});

  @override
  State<D15> createState() => _D15State();
}

class _D15State extends State<D15> {
  List colorsOld = [];
  List colorsShuffle = [];

  Map<int, String> colorsList = {
    0: 'assets/#3781C1.png',
    1: 'assets/#3583B4.png',
    2: 'assets/#3B84A7.png',
    3: 'assets/#39859C.png',
    4: 'assets/#3B8690.png',
    5: 'assets/#3F8782.png',
    6: 'assets/#588473.png',
    7: 'assets/#6C8164.png',
    8: 'assets/#837B5D.png',
    9: 'assets/#907660.png',
    10: 'assets/#9E6E6F.png',
    11: 'assets/#9F6D7C.png',
    12: 'assets/#9C6D89.png',
    13: 'assets/#927099.png',
    14: 'assets/#8F6FA4.png',
    //15: 'assets/#8073B2.png',
    // 16: 'assets/#7567A3.png'
  };

  void keyList() {
    colorsOld = colorsList.values.toList();
    colorsShuffle = colorsList.values.toList();
    colorsShuffle.remove('assets/#3781C1.png');
    colorsShuffle.remove('assets/#8F6FA4.png');

    colorsShuffle.shuffle();
    colorsShuffle.insert(0, 'assets/#3781C1.png');
    colorsShuffle.insert(14, 'assets/#8F6FA4.png');
  }

  void submit() {
    for (var i = 0; i < colorsList.length; i++) {
      var key = colorsList.keys
          .firstWhere((element) => colorsList[element] == colorsShuffle[i]);
      indexList.add(key);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const d15Result()),
    );
  }

  int variableSet = 0;
  ScrollController? _scrollController;
  double? width;
  double? height;

  @override
  void initState() {
    super.initState();
    keyList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ColorUser>?>.value(
      value: DatabaseService(uid: '').users,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Color Deficiency Test '),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                }),
            // TextButton.icon(
            //   onPressed: () => _showSettingsPanel(),
            //   icon: Icon(Icons.settings),
            //   label: Text('settings'))
          ],
        ),
        body: DragAndDropGridView(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 4,
          ),
          padding: const EdgeInsets.fromLTRB(187, 15, 160, 0),
          itemBuilder: (context, index) => Card(
            elevation: 2,
            child: LayoutBuilder(
              builder: (context, constrains) {
                if (variableSet == 0) {
                  height = constrains.maxHeight;
                  width = constrains.maxWidth;
                  variableSet++;
                }
                return GridTile(
                  child: Image(
                    image: AssetImage(colorsShuffle[index]),
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                );
              },
            ),
          ),
          itemCount: colorsList.length,
          onWillAccept: (oldIndex, newIndex) {
            if (colorsShuffle[oldIndex] == "assets/#3781C1.png" || colorsShuffle[newIndex] == "assets/#3781C1.png" 
            || colorsShuffle[oldIndex] == "assets/#8F6FA4.png" || colorsShuffle[newIndex] == "assets/#8F6FA4.png") {
              return false;
            }
            return true;
          },
          onReorder: (oldIndex, newIndex) {
            final tempColor = colorsShuffle[oldIndex];
            colorsShuffle[oldIndex] = colorsShuffle[newIndex];
            colorsShuffle[newIndex] = tempColor;

            setState(() {});
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Align(
            alignment: Alignment.centerLeft,
            heightFactor: 3.62,
            child: SizedBox(
              width: 70,
              height: 200,
              child: FloatingActionButton(
                  onPressed: () {}, child: SubmitButton(submit: submit)),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class d15Result extends StatelessWidget {
  const d15Result({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ColorUser>?>.value(
        value: DatabaseService(uid: '').users,
        initialData: null,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: const Text('Color Deficiency Test '),
            backgroundColor: Colors.brown[400],
            elevation: 0,
            actions: [
              ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('logout'),
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
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Trichromacy',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Normal Color Vision',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(
                          height: 400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        widthFactor: 1.75,
                        child: SizedBox(
                          width: 250,
                          height: 70,
                          child: FloatingActionButton(
                              onPressed: () {},
                              child: const SaveButton(save: save)),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}

void save() {
  print(indexList);
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black;

    final protan = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.red;

    final deutan = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.green;

    final tritan = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.blue;

    List<Pointers> pointers = [
      //Coordinates(id: 0, x: 80, y: 300),
      Pointers(text: '1', x: 2, y: 165),
      Pointers(text: '2', x: 15, y: 90),
      Pointers(text: '3', x: 65, y: 25),
      Pointers(text: '4', x: 140, y: -5),
      Pointers(text: '5', x: 235, y: -5),
      Pointers(text: '6', x: 310, y: 45),
      Pointers(text: '7', x: 345, y: 110),
      Pointers(text: '8', x: 357, y: 175),
      Pointers(text: '9', x: 345, y: 250),
      Pointers(text: '10', x: 307, y: 330),
      Pointers(text: '11', x: 230, y: 375),
      Pointers(text: '12', x: 135, y: 380),
      Pointers(text: '13', x: 60, y: 350),
      Pointers(text: '14', x: 5, y: 285),
      Pointers(text: '15', x: -2, y: 225),
      //Coordinates(id: 16, x: 100, y: 409)
    ];

    List<Coordinates> coordinates = [
      //Coordinates(id: 0, x: 80, y: 300),
      Coordinates(id: 1, x: 25, y: 180),
      Coordinates(id: 2, x: 40, y: 110),
      Coordinates(id: 3, x: 80, y: 60),
      Coordinates(id: 4, x: 150, y: 30),
      Coordinates(id: 5, x: 235, y: 30),
      Coordinates(id: 6, x: 300, y: 70),
      Coordinates(id: 7, x: 335, y: 130),
      Coordinates(id: 8, x: 345, y: 190),
      Coordinates(id: 9, x: 335, y: 260),
      Coordinates(id: 10, x: 300, y: 330),
      Coordinates(id: 11, x: 235, y: 370),
      Coordinates(id: 12, x: 150, y: 370),
      Coordinates(id: 13, x: 80, y: 340),
      Coordinates(id: 14, x: 40, y: 290),
      Coordinates(id: 15, x: 25, y: 220),
      //Coordinates(id: 16, x: 100, y: 409)
    ];

    for (int i = 0; i < pointers.length; i++) {
      TextSpan span = TextSpan(
        style: const TextStyle(
            color: Colors.black, fontSize: 24.0, fontFamily: 'Roboto'),
        text: pointers[i].text,
      );
      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(pointers[i].x, pointers[i].y));
    }

    void compare() {
      for (int i = 0; i < 15; i++) {
        entriesX.add(coordinates[indexList[i]].x);
        entriesY.add(coordinates[indexList[i]].y);
        canvas.drawCircle(Offset(entriesX[i], entriesY[i]), 5.5, paint);
      }
    }

    compare();

    canvas.drawLine(const Offset(100, 0), const Offset(200, 400), protan);
    canvas.drawLine(const Offset(200, 0), const Offset(100, 400), deutan);
    canvas.drawLine(const Offset(0, 210), const Offset(360, 150), tritan);

    void connect() {
      for (int i = 0; i < 15 - 1; i++) {
        canvas.drawLine(Offset(entriesX[i], entriesY[i]),
            Offset(entriesX[i + 1], entriesY[i + 1]), paint);
      }
    }

    connect();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
