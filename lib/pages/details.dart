import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/song_controller.dart';

class DetailsPage extends StatelessWidget {
  final value = Get.arguments;
  final _songController = SongController();
  final divider = const Divider(
    height: 30,
  );
  final icon = IconData;

  DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value.title ?? 'No title provided'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: 'Song Title:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.title ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Scale:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.scale ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Marefiya:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.marefiya ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Type:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.typesong ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Style:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.style ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Key: ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.keysong ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Transpose:  ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${value.transpose ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              divider,
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(15))),
                    onPressed: () {
                      Get.offNamed('/edit', arguments: value);
                    },
                    child: const Text(
                      'Edit the Song',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(15))),
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titleTextStyle: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              title: const Text(
                                  "Are you sure you want to delete the song"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    var result = await _songController
                                        .deleteSong(value.id);
                                    if (result > 0) {
                                      Get.toNamed('/home');
                                      Get.snackbar('Successfully', 'Deleted',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.black38,
                                          colorText: Colors.white);
                                    }
                                  },
                                  child: const Text("Yes"),
                                )
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Delete the Song',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
