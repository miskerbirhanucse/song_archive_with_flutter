import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/music_theory/harmony_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            bottom: 5,
            right: 5,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 1.15,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: width,
                            height: 50,
                            color: Colors.purple,
                            child: const Center(
                              child: Text(
                                'Introduction',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Music theory is a complex and extensive subject. There are several practices, disciplines, and concepts.',
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Best to learn music fundamentals first before exploring advanced music theory. ',
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "The building blocks that form musical compositions include:",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "•	Harmony \n\n•	Melody\n\n•	Rhythm",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Solidly understanding these three core elements will help you learn basic music theory.",
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              HomePosition(width: width),
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const HarmonyPage()),
                    );
                  },
                  child: const Text("next"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
