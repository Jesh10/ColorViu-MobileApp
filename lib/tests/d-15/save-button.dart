import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.save});
  final VoidCallback save;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: save,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.all(10),
          child: const Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      )
    );
  }
}
