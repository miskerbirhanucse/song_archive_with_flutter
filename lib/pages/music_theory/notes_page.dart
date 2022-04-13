import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/music_theory/modes_page.dart';
import 'package:writestyle/pages/music_theory/rhythm_page.dart';
import 'package:writestyle/pages/music_theory/widget/home_position.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

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
                                "MUSICAL NOTES AND INTERVALS",
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
                            "Let’s start this music theory for beginner’s guide by going over harmony and melody. This section describes all the available notes and the specific relationships between them.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset('assets/piano.jpg'),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "MUSICAL CHORDS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "A chord is a combination of two or more notes played at the same time. They’re built off a single starting note called the root.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "You can create chords from all twelve notes. There are also four basic types of chords in music:",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          richTextWithTwoField(
                              first: "•	Major – ",
                              second:
                                  "Has a major third and a perfect fifth above the root"),
                          richTextWithTwoField(
                              first: "•	Minor –  ",
                              second:
                                  " Has a minor third and a perfect fifth above the root"),
                          richTextWithTwoField(
                              first: "•	Diminished – ",
                              second:
                                  "Has a minor third and a diminished fifth above the root"),
                          richTextWithTwoField(
                              first: "•	Augmented –  ",
                              second:
                                  "– Has a major third and an augmented fifth above the root"),
                          const Text(
                            "The chords and chord progressions in a piece of music support or complement the melody.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          chordsWidget(
                            title: "TRIAD CHORDS",
                            first:
                                "The most basic chords are triads. A triad is a chord made of three notes. Triads have a root note, a third (four semitones above the root), and a perfect fifth (seven semitones above the root).",
                            second:
                                "Triads are also the foundation for more complex chords. For example, you can create seventh and ninth cords by adding notes above a tried.",
                          ),
                          chordsWidget(
                            title: "SEVENTH CHORDS",
                            first:
                                "A seventh chord adds a note above the basic triad. Seventh chords have a root note, a third, a perfect fifth, and a seventh.",
                            second:
                                "For example, a C major seventh has the notes: C–E–G-B. There are also five main types of seventh chords: major, minor, dominant, diminished, and half-diminished.",
                          ),
                          chordsWidget(
                            title: "MAJOR CHORDS",
                            first:
                                "Major chords have a root note, a major third, and a perfect fifth. A chord with these three notes alone is a major triad.",
                            second:
                                "For example, a C major triad has the notes: C-E-G. You can also add notes to build more complex chords.",
                          ),
                          chordsWidget(
                            title: "MINOR CHORDS",
                            first:
                                "Minor chords have a root note, a minor third, and a perfect fifth. A chord with these three notes alone is a minor triad.",
                            second:
                                "For example, a C minor triad has the notes C-E♭-G. You can also add notes to build more complex chords.",
                          ),
                          chordsWidget(
                            title: "DIMINISHED CHORDS",
                            first:
                                "Diminished chords sound tense, dissonant, and dramatic. They have a root note, minor third, and a diminished fifth (six semitones above the root).",
                            second:
                                "For example, a C diminished triad has the notes: C-E♭-G♭.",
                          ),
                          chordsWidget(
                            title: "AUGMENTED CHORDS",
                            first:
                                "Augmented chords sound dissonant, unsettling, and mysterious. They have a root note, major third, and an augmented fifth (eight semitones above the root).",
                            second:
                                "For example, a C augmented triad has the notes: C–E–G#.",
                          ),
                          chordsWidget(
                            title: "CHORD EXTENSIONS",
                            first:
                                "Chord extensions are notes added to the basic triad beyond the seventh. These notes extend into the next octave. There are four chord extensions: the 9th, 11th, and 13th.",
                            second:
                                "Extended chords create a richer, more harmonically complex sound than basic major and minor triads. They also provide additional voice leading possibilities, which makes chord progressions sound more interesting.",
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
                        builder: (context) => const Rhythm()));
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
                        builder: (context) => const ModesPage()));
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
