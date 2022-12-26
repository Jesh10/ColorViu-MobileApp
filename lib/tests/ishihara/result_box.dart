import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
    required this.deficiency,
    required this.statement, 
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  final String deficiency;
  final String statement;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                deficiency,
                style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  statement,
                  style: const TextStyle(color: Colors.white, fontSize: 21),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              CircleAvatar(
                radius: 70,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength - 5
                        ? Colors.red
                        : Colors.green,
                child: Text(
                  '$result/$questionLength',
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              const SizedBox(height: 35),
              GestureDetector(
                  onTap: onPressed,
                  child: const Text(
                    'Start Over',
                    style: TextStyle(
                        color: Colors.white, fontSize: 35, letterSpacing: 1),
                  )),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
