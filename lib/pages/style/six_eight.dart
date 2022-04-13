import 'package:flutter/material.dart';

import '../../widgets/build_screen.dart';
import '../../controller/song_controller.dart';
import '../../model/song.dart';

class SixEight extends StatefulWidget {
  const SixEight({Key? key}) : super(key: key);

  @override
  _SixEightState createState() => _SixEightState();
}

class _SixEightState extends State<SixEight> {
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
    var songs = await _songController.readSongByStyle('6-8');
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
