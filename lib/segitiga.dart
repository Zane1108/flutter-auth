import 'package:flutter/material.dart';

class Segitiga extends StatelessWidget {
  const Segitiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      color: Colors.red,
      child: const Text(
        'ini Segitiga',
        style: TextStyle(
          fontSize: 20,
        ),
      ),

    );
  }
}

