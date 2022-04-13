import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writestyle/controller/song_controller.dart';
import 'package:writestyle/model/song.dart';
import 'package:writestyle/widgets/build_screen.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final _songController = SongController();

  final List<Song> _songsList = [];
  @override
  void initState() {
    super.initState();
    getAllSongs();
  }

  getAllSongs() async {
    var songs = await _songController.readSongByFavorite(1);
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
        _songsList.add(songModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offNamed('/home');
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
        ),
        body: buildScreen(_songsList),
      ),
    );
  }
}
