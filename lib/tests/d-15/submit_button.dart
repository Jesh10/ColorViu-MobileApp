import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.submit});
  final VoidCallback submit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: submit,
      child: Container(
          width: 80,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: RotatedBox(
            quarterTurns: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.all(17),
              child: const Text(
                'Submit',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          )),
    );
  }
}
