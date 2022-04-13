import 'package:flutter/material.dart';

import '../../widgets/build_screen.dart';
import '../../controller/song_controller.dart';
import '../../model/song.dart';

class Waltz extends StatefulWidget {
  const Waltz({Key? key}) : super(key: key);

  @override
  _WaltzState createState() => _WaltzState();
}

class _WaltzState extends State<Waltz> {
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
    var songs = await _songController.readSongByStyle('Waltz');
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
