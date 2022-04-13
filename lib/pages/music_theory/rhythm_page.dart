import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/music_theory/melody_page.dart';
import 'package:writestyle/pages/music_theory/notes_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class Rhythm extends StatelessWidget {
  const Rhythm({Key? key}) : super(key: key);

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
                                "WHAT IS RHYTHM IN MUSIC?",
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
                            "Rhythm is an essential element of music with more than one meaning. For example:",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "•	Rhythm is a recurring movement of notes and rests (silences) in time. It’s the human perception of time.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "•	Rhythm also describes a pattern of strong and weak notes or voices that repeat throughout a song. These patterns can be created with drums, percussion, instruments, and vocals.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "The basic elements that comprise musical rhythm include: ",
                            style: textStyle,
                          ),
                          richTextWithTwoField(
                            first: "•	Beat –  ",
                            second:
                                "A repeating pulse that underlies a musical pattern.",
                          ),
                          richTextWithTwoField(
                            first: "•	Meter – ",
                            second:
                                "A specific pattern of strong and weak pulses",
                          ),
                          richTextWithTwoField(
                            first: "•	Time Signature – ",
                            second: "The number of beats per measure",
                          ),
                          richTextWithTwoField(
                            first: "•	Tempo (BPM) – ",
                            second:
                                "Indicates how fast or slow a piece of music plays",
                          ),
                          richTextWithTwoField(
                            first: "•	Strong and Weak Beats – ",
                            second:
                                "Strong beats are the downbeats, and weak beats are the offbeats between the downbeats",
                          ),
                          richTextWithTwoField(
                            first: "•	Syncopation – ",
                            second:
                                "Rhythms that accent or emphasize the offbeats",
                          ),
                          richTextWithTwoField(
                            first: "•	Accents – ",
                            second:
                                "Refers to the intensity or emphases placed on notes",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Understanding rhythm will help you create great harmonies and melodies.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Also, the rhythm section or pulse propels a piece of music. It acts as the rhythmic backbone for other musical elements.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          )
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
                        builder: (context) => const MelodyPage()));
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
                        builder: (context) => const NotesPage()));
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

  Padding richTextWithTwoField(
      {required String first, required String second}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 5),
      child: RichText(
          text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
              text: first,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: second, style: const TextStyle(fontSize: 16)),
        ],
      )),
    );
  }
}
