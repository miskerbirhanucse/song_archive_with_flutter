import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: const [
            Image(
              image: AssetImage("assets/ABOUT.jpg"),
            ),
            Text(
              "version: 2.0",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            Text('contact me: miskerbirhanu@gmail.com')
          ],
        ),
      ),
    );
  }
}
