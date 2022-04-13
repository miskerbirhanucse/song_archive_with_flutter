import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/music_theory/chords_page.dart';
import 'package:writestyle/pages/music_theory/notes_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class ModesPage extends StatelessWidget {
  const ModesPage({Key? key}) : super(key: key);

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          Container(
                            height: 50,
                            width: width,
                            color: Colors.purple,
                            child: const Center(
                              child: Text(
                                "MUSIC MODES",
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
                            "Musical modes are scales derived from a parent scale. There are seven music modes. Each mode is a slight variation of a scale. They use all the same notes and interval patterns as the parent scale.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "The main difference is the root note used to build the scale. Starting a scale on a different note defines the tonal center, giving it distinct melodic characteristics.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "The seven musical modes are:The seven musical modes are:MUSICAL CHORDS",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          richTextWithTwoField(
                              first: "•	I –  ", second: "Ionian (major scale)"),
                          richTextWithTwoField(
                              first: "•	ii –  ",
                              second:
                                  " Dorian (major scale starting on the 2nd degree)"),
                          richTextWithTwoField(
                              first: "•	iii –  ",
                              second:
                                  "Phrygian (major scale starting on the 3rd degree)"),
                          richTextWithTwoField(
                              first: "•	IV –  ",
                              second:
                                  "Lydian (major scale starting on the 4th degree)"),
                          richTextWithTwoField(
                              first: "•	V –   ",
                              second:
                                  "Mixolydian (major scale starting on the 5th degree)"),
                          richTextWithTwoField(
                              first: "•	vi –  ",
                              second:
                                  " Aeolian (natural minor scale or major scale starting on the 6th degree)"),
                          richTextWithTwoField(
                              first: "•	vii –  ",
                              second:
                                  "Locrian (major scale starting on the 7th degree)"),
                          const Text(
                            "Learning musical modes goes beyond basic music theory and is more advanced. However, getting familiar with these terms and basic functions is helpful.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          chordsWidget(
                            title: "COUNTERPOINT",
                            first:
                                "Counterpoint is the relationship between two or more melody lines played at the same time. These melodies or voices work together to create pleasant-sounding harmonies.",
                            second:
                                "The melodies that create counterpoint are dependent on each other to create harmony. However, they are independent in rhythm and contour.",
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
                        builder: (context) => const NotesPage()));
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
                        builder: (context) => const ChordsPage()));
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

  Column chordsWidget(
      {required String title, required String first, required String second}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(first, style: textStyle),
        const SizedBox(
          height: 15,
        ),
        Text(second, style: textStyle),
        const SizedBox(
          height: 15,
        ),
      ],
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
