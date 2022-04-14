import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            const Image(
              image: AssetImage("assets/2022.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Column(
                  children: [
                    const Text("Contact Me ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    const SizedBox(
                      width: 50,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Misker Berhanu",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      width: 60,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            const url = 'https://t.me/miskerB';
                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            }
                          },
                          child: SvgPicture.asset(
                            'assets/telegram.svg',
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () async {
                            const phoneNumber = '+251926998742';
                            const url = 'tel:$phoneNumber';
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                          child: Image.asset(
                            'assets/phone.png',
                            height: 50,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
