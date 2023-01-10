import 'package:colorviu/models/coordinates.dart';
import 'package:colorviu/models/pointers.dart';
import 'package:colorviu/services/auth.dart';
import 'package:flutter/material.dart';

List entriesX = [];
List entriesY = [];

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
  Pointers(text: '13', x: 50, y: 360),
  Pointers(text: '14', x: 3, y: 295),
  Pointers(text: '15', x: -2, y: 225),
  //Coordinates(id: 16, x: 100, y: 409)
];

List<Coordinates> coordinates = [
  //Coordinates(id: 0, x: 80, y: 300),
  Coordinates(id: 1, x: 25, y: 180),
  Coordinates(id: 2, x: 40, y: 110),
  Coordinates(id: 3, x: 80, y: 60),
  Coordinates(id: 4, x: 150, y: 30),
  Coordinates(id: 5, x: 240, y: 30),
  Coordinates(id: 6, x: 300, y: 70),
  Coordinates(id: 7, x: 335, y: 130),
  Coordinates(id: 8, x: 345, y: 190),
  Coordinates(id: 9, x: 335, y: 260),
  Coordinates(id: 10, x: 300, y: 330),
  Coordinates(id: 11, x: 235, y: 370),
  Coordinates(id: 12, x: 150, y: 370),
  Coordinates(id: 13, x: 80, y: 350),
  Coordinates(id: 14, x: 40, y: 290),
  Coordinates(id: 15, x: 25, y: 220),
  //Coordinates(id: 16, x: 100, y: 409)
];

// ignore: must_be_immutable
class ShowD15 extends StatefulWidget {
  ShowD15({
    Key? key,
    required this.result,
    required this.deficiency,
    required this.statement,
  }) : super(key: key);

  List result;
  String deficiency;
  final String statement;

  @override
  State<ShowD15> createState() => _ShowD15State();
}

class _ShowD15State extends State<ShowD15> {
  final AuthService _auth = AuthService();

  void entries() {
    for (int i = 0; i < 15; i++) {
      entriesX.add(coordinates[widget.result[i]].x);
      entriesY.add(coordinates[widget.result[i]].y);
    }
  }

  @override
  void initState() {
    super.initState();
    entries();
  }

  Future<bool> _onWillPop() async {
    entriesX = [];
    entriesY = [];
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: const Text('D-15 Arrangement'),
            backgroundColor: Colors.brown[400],
            elevation: 0,
            actions: [
              ElevatedButton.icon(
                  icon: const Icon(Icons.person),
                  label: const Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  }),
            ],
          ),
          body: SingleChildScrollView(
              child: Container(
            height: 900,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/white.jpg"), fit: BoxFit.cover),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.deficiency,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 50),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.statement,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 23),
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
                    const SizedBox(height: 25),
                  ],
                )),
          )),
        ));
  }
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
      ..strokeWidth = 5
      ..color = Colors.red;

    final deutan = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Colors.green;

    final tritan = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Colors.blue;

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
        canvas.drawCircle(Offset(entriesX[i], entriesY[i]), 5.5, paint);
      }
    }

    compare();

    void connect() {
      canvas.drawLine(const Offset(100, 0), const Offset(200, 400), protan);
      canvas.drawLine(const Offset(200, 0), const Offset(100, 400), deutan);
      canvas.drawLine(const Offset(0, 210), const Offset(360, 156), tritan);
      for (int i = 0; i < 15 - 1; i++) {
        canvas.drawLine(Offset(entriesX[i], entriesY[i]),
            Offset(entriesX[i + 1], entriesY[i + 1]), paint);
      }
    }

    connect();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
