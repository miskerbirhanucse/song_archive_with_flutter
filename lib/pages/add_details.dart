import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:writestyle/const/button.dart';

import '../controller/song_controller.dart';
import '../model/song.dart';
import '../widgets/drawer.dart';

class AddSongPage extends StatefulWidget {
  const AddSongPage({Key? key}) : super(key: key);

  @override
  _AddSongPageState createState() => _AddSongPageState();
}

class _AddSongPageState extends State<AddSongPage> {
  final songController = Get.put(SongController());
  final _song = Song();
  String? _songTitle;
  String? _songTranspose;
  String? _songMarefiya;
  String? _songScale;
  String? _songStyle;
  String? _songType;
  String? _songKey;
  int _songColor=7;
  final _formKey = GlobalKey<FormState>();
  final dropdownState = GlobalKey<FormFieldState>();
  final _scaleDropDown = GlobalKey<FormFieldState>();
  final _marefiyaDropDown = GlobalKey<FormFieldState>();
  final _typeDropDown = GlobalKey<FormFieldState>();
  final _keyDropDown = GlobalKey<FormFieldState>();
  final List<String> _scale = const [
    "Tizita Major",
    "Tizita Minor",
    "Batti",
    "Ambasell",
    "Anchi-hoye",
    "Natural Minor",
    "Diatonic",
    "Other Pentatonic"
  ];
  final List<String> _styles = const [
    "Reggae",
    "Pop",
    "Disco",
    "SlowRock",
    "Wollo",
    "6-8",
    "Waltz"
  ];
  final List<String> _type = const [
    "Yetselot",
    "Yeneseha",
    "Yemesgana",
    "Yemetsnanat"
  ];
  final List<String> _key = const [
    "C",
    "C#",
    "D",
    "D#",
    "E",
    "F",
    "F#",
    "G",
    "G#",
    "A",
    "A#",
    "B"
  ];
  final List<String> _marefiya = const ["1st", "2nd", "5th", "6th"];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offNamed('/home');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Song Detail'),
        ),
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 45.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Song Title";
                      }
                      return null;
                    },
                    onChanged: (title) {
                      _songTitle = title;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      labelText: 'Song Title',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          key: _keyDropDown,
                          value: _songKey,
                          hint: const Text(
                            'Select Key',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? key) {
                            setState(() {
                              _songKey = key;
                            });
                          },
                          items: _key.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          key: _scaleDropDown,
                          value: _songScale,
                          hint: const Text(
                            'Select Scale',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? style) {
                            setState(() {
                              _songScale = style;
                            });
                          },
                          items: _scale.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          key: dropdownState,
                          value: _songStyle,
                          hint: const Text(
                            'Select Style',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? style) {
                            setState(() {
                              _songStyle = style;
                              _songColor = _styles.indexOf(style!);
                            });
                          },
                          items: _styles.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          key: _marefiyaDropDown,
                          value: _songMarefiya,
                          hint: const Text(
                            'Select Marefiya',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? style) {
                            setState(() {
                              _songMarefiya = style;
                            });
                          },
                          items: _marefiya.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          key: _typeDropDown,
                          value: _songType,
                          hint: const Text(
                            'Select Song Type',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (String? type) {
                            setState(() {
                              _songType = type;
                            });
                          },
                          items: _type.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (String transpose) {
                            _songTranspose = transpose;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            labelText: 'Transpose',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: style,
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _song.title = _songTitle;
                        _song.scale = _songScale;
                        _song.style = _songStyle;
                        _song.marefiya = _songMarefiya;
                        _song.transpose = _songTranspose;
                        _song.typesong = _songType;
                        _song.keysong = _songKey;
                        _song.songcolor = _songColor;
                        var result = await songController.addSong(_song);

                        if (result > 0) {
                          Get.toNamed('/home');
                          Get.snackbar('Successfully', 'Song Added',
                              duration: const Duration(seconds: 1),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.black38,
                              colorText: Colors.white);
                        } else {
                          Get.toNamed('/home');
                          Get.snackbar('faild', 'Song is not Added',
                              duration: const Duration(seconds: 1),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.black38,
                              colorText: Colors.white);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
