import 'package:flutter/material.dart';

class Kerucut extends StatelessWidget {
  const Kerucut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      color: Colors.red,
      child: const Text(
        'ini Kerucut',
        style: TextStyle(
          fontSize: 20,
        ),
      ),

    );
  }
}

