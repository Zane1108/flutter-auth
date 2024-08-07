import 'package:flutter/material.dart';

class Persegi extends StatelessWidget {
  const Persegi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      color: Colors.red,
      child: const Text(
        'ini persegi',
        style: TextStyle(
          fontSize: 20,
        ),
      ),

    );
  }
}

