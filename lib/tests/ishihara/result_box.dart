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
      backgroundColor: Colors.blue,
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                deficiency,
                style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  statement,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              CircleAvatar(
                radius: 80,
                backgroundColor: result < questionLength - 5
                  ? Colors.red
                  : Colors.green,
                child: Text(
                  '$result/$questionLength',
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))
                ),
                child: GestureDetector(
                  onTap: onPressed,
                  child: const Text(
                    'Submit Results',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 30,),
                  )
                ),
              ),
              const SizedBox(height: 10),
            ]),
      ),
    );
  }
}
