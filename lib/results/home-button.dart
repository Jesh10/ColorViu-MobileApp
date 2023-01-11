import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key, required this.home});
  final VoidCallback home;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: home,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.all(10),
          child: const Text(
            'Back Home',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      )
    );
  }
}
