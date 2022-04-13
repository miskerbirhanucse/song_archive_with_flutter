import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/song.dart';

class SearchSong extends SearchDelegate<Song> {
  List<Song> suggestions = [];
  SearchSong(this.suggestions);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, Song());
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestion = query.isEmpty
        ? suggestions
        : suggestions
            .where((target) =>
                target.title!.contains(RegExp(query, caseSensitive: false)))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          suggestion[index].title!,
          style: const TextStyle(fontSize: 17),
        ),
        onTap: () => Get.toNamed('/detail', arguments: suggestion[index]),
      ),
      itemCount: suggestion.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? suggestions
        : suggestions
            .where((target) =>
                target.title!.contains(RegExp(query, caseSensitive: false)))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          suggestion[index].title!,
          style: const TextStyle(fontSize: 17),
        ),
        onTap: () => Get.toNamed('/detail', arguments: suggestion[index]),
      ),
      itemCount: suggestion.length,
    );
  }
}
