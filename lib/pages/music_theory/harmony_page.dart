import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/music_theory/introduction.dart';
import 'package:writestyle/pages/music_theory/melody_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class HarmonyPage extends StatelessWidget {
  const HarmonyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
            left: 15.0,
            right: 5,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 1.15,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Container(
                            height: 50,
                            width: width,
                            color: Colors.purple,
                            child: const Center(
                              child: Text(
                                "WHAT IS HARMONY IN MUSIC ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Harmony is when multiple notes or voices play simultaneously to produce a new sound. The combined sounds in harmonies complement one another and sound pleasing.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Chords and chord progressions are examples of harmony. A chord has three or more notes that play at the same time. The chords and chord progressions in a piece of music support or complement the melody.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Combining vocal parts also creates harmony. The combined voices of a choir are a perfect example. The multiple voices that make up a choir blend to make a harmonious sound.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                              text: const TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(
                                text:
                                    "However, not all harmonies are pleasing to our ear. There are two main types of harmony: ",
                                style: textStyle,
                              ),
                              TextSpan(
                                  text: "dissonant ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              TextSpan(text: "and "),
                              TextSpan(
                                  text: "consonant.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          )),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: RichText(
                                text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Dissonant harmony ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                TextSpan(
                                  text:
                                      "adds notes that do not sound pleasant when played together. The result adds tension and makes the chord sound unstable. This tension releases by resolving to consonant chords. Dissonant interval examples are seconds, sevenths, and ninths.",
                                  style: textStyle,
                                ),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: RichText(
                                text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Consonant harmony ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "sounds stable and pleasing. All the notes in a consonant chord have intervals that play nicely together. Constant chords also transition smoothly with one another in a progression. Consonant interval examples are unison, thirds, fifths, and octaves.",
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Introduction()));
                  },
                  child: const Text("prev"),
                ),
              ),
              HomePosition(width: width),
              Positioned(
                right: 20,
                bottom: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MelodyPage()));
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
