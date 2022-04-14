import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writestyle/const/button.dart';

import '../widgets/drawer.dart';
import '../controller/song_controller.dart';

class EditSong extends StatefulWidget {
  final editValue = Get.arguments;
  EditSong({Key? key}) : super(key: key);

  @override
  _EditSongState createState() => _EditSongState();
}

class _EditSongState extends State<EditSong> {
  final songController = Get.put(SongController());
  final List<String> _scale = [
    "Tizita Major",
    "Tizita Minor",
    "Batti",
    "Ambasell",
    "Anchi-hoye",
    "Natural Minor",
    "Diatonic",
    "Other Pentatonic"
  ];
  final List<String> _styles = [
    "Reggae",
    "Pop",
    "Disco",
    "SlowRock",
    "Wollo",
    "6-8",
    "Waltz"
  ];
  final List<String> _type = [
    "Yetselot",
    "Yeneseha",
    "Yemesgana",
    "Yemetsnanat"
  ];
  final List<String> _key = [
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
    "A#"
  ];
  final List<String> _marefiya = ["1st", "2nd", "5th", "6th"];
  final dropdownState = GlobalKey<FormFieldState>();
  final _scaleDropDown = GlobalKey<FormFieldState>();
  final _marefiyaDropDown = GlobalKey<FormFieldState>();
  final _typeDropDown = GlobalKey<FormFieldState>();
  final _keyDropDown = GlobalKey<FormFieldState>();
  TextEditingController? _editTitle;
  TextEditingController? _editTranspose;
  String? _style;
  String? _songMarefiya;
  String? _songScale;
  String? _songType;
  String? _songKey;
  int? _isFavorite;
  Color? color;
  @override
  void initState() {
    super.initState();
    _editTitle = TextEditingController(text: '${widget.editValue.title ?? ''}');
    _editTranspose =
        TextEditingController(text: '${widget.editValue.transpose ?? ''}');


    _style = widget.editValue.style;
    _songMarefiya = widget.editValue.marefiya;
    _songScale = widget.editValue.scale;
    _songType = widget.editValue.typesong;
    _songKey = widget.editValue.keysong;
    _isFavorite = widget.editValue.isFavorite ?? 0;
    _isFavorite == 1 ? color = Colors.red : color = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Song'),
        ),
        drawer: const AppDrawer(),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          Column(children: [
            const SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: _editTitle,
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
              height: 60,
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
                    onChanged: (String? style) {
                      setState(() {
                        _songKey = style;
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
                    items: _styles
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    key: dropdownState,
                    onChanged: (String? value) {
                      setState(() {
                        _style = value;
                      });
                    },
                    value: _style,
                    hint: const Text(
                      'Select Style',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
               const  SizedBox(
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
               const  SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    controller: _editTranspose,
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
            Row(
              children: [
                const Text('Favorite  :',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: color,
                  onPressed: () {
                    setState(() {
                      _isFavorite == 0 ? _isFavorite = 1 : _isFavorite = 0;
                      if (_isFavorite == 0) {
                        color = null;
                      } else {
                        color = Colors.red;
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: style,
              onPressed: () async {
                widget.editValue.title = _editTitle!.text;
                widget.editValue.style = _style;
                widget.editValue.keysong = _songKey;
                widget.editValue.typesong = _songType;
                widget.editValue.scale = _songScale;
                widget.editValue.marefiya = _songMarefiya;
                widget.editValue.transpose = _editTranspose!.text;
                widget.editValue.isFavorite = _isFavorite;

                var result = await songController.updateSong(widget.editValue);
                if (result > 0) {
                  Get.offNamed('/home');
                  Get.snackbar('Successfully', 'Song Updated',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black38,
                      colorText: Colors.white);
                } else {
                  Get.offNamed('/home');
                  Get.snackbar('faild', 'Song is not updated!!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black38,
                      colorText: Colors.red);
                }
              },
              child: const Text('Update Song'),
            )
          ]),
        ]));
  }
}
