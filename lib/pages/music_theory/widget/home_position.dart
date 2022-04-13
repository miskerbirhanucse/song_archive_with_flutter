import 'package:flutter/material.dart';
import 'package:writestyle/pages/home.dart';

class HomePosition extends StatelessWidget {
  final double width;
  const HomePosition({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: width / 2.5,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: const Text("Home"),
      ),
    );
  }
}
