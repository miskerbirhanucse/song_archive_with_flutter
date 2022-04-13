import 'package:flutter/material.dart';
import 'package:writestyle/pages/music_theory/harmony_page.dart';
import 'package:writestyle/pages/music_theory/rhythm_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class MelodyPage extends StatelessWidget {
  const MelodyPage({Key? key}) : super(key: key);

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
                            color: Colors.purple,
                            height: 50,
                            width: width,
                            child: const Center(
                              child: SelectableText(
                                "WHAT IS MELODY IN MUSIC?",
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
                            "Melody is a succession of notes or voices arranged into a musical phrase. A song’s melody is often the most memorable and recognizable part.",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Melodies can be created with instruments or vocals. They have two or more notes in a sequence that sound musically pleasing. Most compositions consist of multiple melodies that repeat.",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: const TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(
                                  text:
                                      "The two primary elements of a melody are"),
                              TextSpan(
                                  text: " pitch ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: "and "),
                              TextSpan(
                                  text: "rhythm :",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Pitch ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "is the audio vibration produced by an instrument or voice. It’s how high or low a note will sound. Arranging these pitches in a series creates a melody.",
                                ),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: RichText(
                                text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Rhythm ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "or duration is the length each pitch will sound. These durations are divided into beat divisions like whole notes, half notes, quarter notes, triplets, etc.",
                                ),
                              ],
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: const TextSpan(
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(
                                  text:
                                      "Melodies also have two types of melodic motion: "),
                              TextSpan(
                                  text: " conjunct  ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: "or  "),
                              TextSpan(
                                  text: "disjunct",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Conjunct motion  ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "is when notes move by whole or half steps. Conjunct is also the most natural and comfortable to play and sing. There are shorter leaps between notes.",
                                ),
                              ],
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: RichText(
                                text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "•	Disjunct motion  ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text:
                                      "has larger leaps between notes. Large interval leaps between notes can make the melody difficult to play or sing. Disjunct motion is also less memorable and smooth sounding.",
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HarmonyPage()));
                  },
                  child: const Text("prev"),
                ),
              ),
              HomePosition(width: width),
              Positioned(
                right: 20,
                bottom: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Rhythm()));
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
