import 'package:colorviu/results/home-button.dart';
import 'package:flutter/material.dart';

class ShowIshihara extends StatefulWidget {
  const ShowIshihara({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.deficiency,
    required this.statement,
  }) : super(key: key);

  final String result;
  final int questionLength;
  final String deficiency;
  final String statement;

  @override
  State<ShowIshihara> createState() => _ShowIshiharaState();
}

class _ShowIshiharaState extends State<ShowIshihara> {
  
  void home() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              widget.deficiency,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                widget.statement,
                style: const TextStyle(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            CircleAvatar(
              radius: 80,
              backgroundColor:
                  int.parse(widget.result) < widget.questionLength - 3 ? Colors.red : Colors.green,
              child: Text(
                '${widget.result}/${widget.questionLength}',
                style: const TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            const SizedBox(height: 25),
            Align(
              alignment: Alignment.bottomCenter,
              widthFactor: 1.75,
              child: SizedBox(
                width: 250,
                height: 70,
                child: FloatingActionButton(
                    onPressed: () {}, child: HomeButton(home: home)),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
