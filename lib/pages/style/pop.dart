import 'package:flutter/material.dart';

import '../../widgets/build_screen.dart';
import '../../controller/song_controller.dart';
import '../../model/song.dart';

class Pop extends StatefulWidget {
  const Pop({Key? key}) : super(key: key);

  @override
  _PopState createState() => _PopState();
}

class _PopState extends State<Pop> {
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
    var songs = await _songController.readSongByStyle('Pop');
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
