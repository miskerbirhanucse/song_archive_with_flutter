import 'package:flutter/material.dart';
import 'package:writestyle/controller/song_controller.dart';
import 'package:writestyle/model/song.dart';
import 'package:writestyle/widgets/build_screen.dart';

class Yemesgana extends StatefulWidget {
  const Yemesgana({Key? key}) : super(key: key);

  @override
  _YemesganaState createState() => _YemesganaState();
}

class _YemesganaState extends State<Yemesgana> {
  final _songController = SongController();

  final List<Song> _songsList = [];

  @override
  void initState() {
    super.initState();
    getAllSongs();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  getAllSongs() async {
    var songs = await _songController.readSongByType('Yemesgana');
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
        _songsList.add(songModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen(_songsList);
  }
}
