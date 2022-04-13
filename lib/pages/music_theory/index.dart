import 'package:flutter/material.dart';
import 'package:writestyle/pages/music_theory/chords_page.dart';
import 'package:writestyle/pages/music_theory/conclusion_page.dart';
import 'package:writestyle/pages/music_theory/harmony_page.dart';
import 'package:writestyle/pages/music_theory/introduction.dart';
import 'package:writestyle/pages/music_theory/melody_page.dart';
import 'package:writestyle/pages/music_theory/modes_page.dart';
import 'package:writestyle/pages/music_theory/notes_page.dart';
import 'package:writestyle/pages/music_theory/rhythm_page.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);
  static const List<String> content = [
    'Introduction',
    'What is Harmony in Music?',
    'What is Melody in Music?',
    'What is Rhythm in Music?',
    'Musical Notes and Intervals',
    'Music Modes',
    'Chords and Chord Extensions',
    'Conclusion'
  ];
  final List<Widget> page = const [
    Introduction(),
    HarmonyPage(),
    MelodyPage(),
    Rhythm(),
    NotesPage(),
    ModesPage(),
    ChordsPage(),
    ConclusionPage()
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Theory Content'),
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return page[index];
                        }));
                      },
                      title: SizedBox(
                        height: 50,
                        child: Center(child: Text(content[index])),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
