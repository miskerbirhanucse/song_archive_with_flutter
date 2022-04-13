import 'package:flutter/material.dart';

import '../../widgets/build_screen.dart';
import '../../controller/song_controller.dart';
import '../../model/song.dart';

class Wello extends StatefulWidget {
  const Wello({Key? key}) : super(key: key);

  @override
  _WelloState createState() => _WelloState();
}

class _WelloState extends State<Wello> {
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
    var songs = await _songController.readSongByStyle('Wello');
    songs.forEach((song) {
      setState(() {
        var songModel = Song();
        songModel.id = song['id'];
        songModel.title = song['title'];
        songModel.scale = song['scale'];
        songModel.style = song['style'];
        songModel.marefiya = song['marefiya'];
        songModel.transpose = song['transpose'];
        _songsList.add(songModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen(_songsList);
  }
}
