import 'package:flutter/material.dart';

class Lingkaran extends StatelessWidget {
  const Lingkaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 90,
      color: Colors.red,
      child: const Text(
        'ini Lingkaran',
        style: TextStyle(
          fontSize: 20,
        ),
      ),

    );
  }
}

