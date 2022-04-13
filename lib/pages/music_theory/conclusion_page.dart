import 'package:flutter/material.dart';
import 'package:writestyle/const/button.dart';
import 'package:writestyle/pages/home.dart';
import 'package:writestyle/pages/music_theory/chords_page.dart';

class ConclusionPage extends StatelessWidget {
  const ConclusionPage({Key? key}) : super(key: key);

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
                                "CONCLUSION",
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
                            "Music theory will give you a deeper understanding of music. But it’s also essential to remember musical theory is not hard rules. It’s a tool to help you create, understand, and communicate music.",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 15,
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ChordsPage()));
                  },
                  child: const Text("prev"),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  child: const Text("finish"),
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
