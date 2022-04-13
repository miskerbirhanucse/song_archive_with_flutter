import 'package:get/get.dart';
import 'package:writestyle/repository/repository.dart';

import '../model/song.dart';

class SongController extends GetxController {
  //List<Song> songs = List<Song>().obs;
  List<Song> songs = [];
  Repository? _repository;
  SongController() {
    _repository = Repository();
  }
  addSong(Song song) async {
    songs.add(song);

    return await _repository!.insertData('songs', song.songMap());
  }

  readSong() async {
    return await _repository!.readData('songs');
  }

  readSongById(songId) async {
    return await _repository!.readDataById('songs', songId);
  }

  readSongByStyle(songStyle) async {
    return await _repository!.readDataByStyle('songs', songStyle);
  }

  readSongByType(songType) async {
    return await _repository!.readDataByType('songs', songType);
  }

  readSongByFavorite(songFavorite) async {
    return await _repository!.readDataByFavorite('songs', songFavorite);
  }

  updateSong(Song song) async {
    return await _repository!.updateSong('songs', song.songUpdateMap());
  }

  deleteSong(songId) async {
    return await _repository!.deleteData('songs', songId);
  }

  changeFavSong(Song song) async {
    return await _repository!.updateSong('songs', song.songUpdateMap());
  }
}
