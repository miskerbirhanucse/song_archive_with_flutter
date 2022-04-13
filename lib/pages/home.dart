import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/drawer.dart';
import '../controller/song_controller.dart';
import '../model/song.dart';
import './search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _songController = SongController();
  final songController = Get.put(SongController());
  final List<Song> _songsList = [];
  final List _colors = const [
    Color(0xff008a4e),
    Color(0xff008080),
    Color(0xff26a780),
    Color(0xfff2aa4c),
    Color(0xff808080),
    Color(0xffd85a7f),
    Color(0xff6e5d6a),
    // Color(0xff101820),
  ];
  int? _isFavorite;
  @override
  void initState() {
    super.initState();
    getAllSongs();
  }

  getAllSongs() async {
    var songs = await _songController.readSong();
    songs.forEach((song) {
      setState(() {
        var songModel = Song();
        songModel.id = song['id'];
        songModel.title = song['title'];
        songModel.scale = song['scale'];
        songModel.style = song['style'];
        songModel.marefiya = song['marefiya'];
        songModel.transpose = song['transpose'];
        songModel.isFavorite = song['isFavorite'];
        songModel.typesong = song['typesong'];
        songModel.keysong = song['keysong'];
        songModel.songcolor = song['songcolor'];
        _songsList.add(songModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await Get.defaultDialog(
          title: 'Confirm Exit',
          middleText: 'Are you sure to quit?',
          actions: [
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: const Text("No"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Song'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Get.offNamed('/addSong'),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchSong(_songsList));
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.offNamed('/addSong'),
          child: const Icon(Icons.add),
        ),
        drawer: const AppDrawer(),
        body: _songsList.isEmpty
            ? const Center(
                child: Text(
                  'No song is added',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            : Scrollbar(
                child: ListView.builder(
                  itemCount: _songsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: _colors[_songsList[index].songcolor!],
                      elevation: 5,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: () async {
                              setState(() {
                                if (_isFavorite == null) {
                                  _isFavorite = 1;
                                } else if (_isFavorite == 0) {
                                  _isFavorite = 1;
                                } else {
                                  _isFavorite = 0;
                                }
                              });
                              final update = _songsList[index];
                              update.isFavorite = _isFavorite;

                              await songController!.updateSong(update);
                            },
                            icon: const Icon(Icons.favorite),
                            color: (_songsList[index].isFavorite == 1
                                ? Colors.red
                                : null),
                          ),
                          title: Text(
                            (_songsList[index].title == null
                                ? 'Song title is not provided'
                                : _songsList[index].title!.capitalizeFirst)!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                          subtitle: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Scale: ${_songsList[index].scale ?? ' '}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  'Marefiya  : ${_songsList[index].marefiya ?? ''}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                Text(
                                  'Transpose  : ${_songsList[index].transpose ?? ''}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Get.toNamed('/detail',
                              arguments: _songsList[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
