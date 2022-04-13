import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildScreen(List songList) {
  return songList.isEmpty
      ? const Center(
          child: Text('No list'),
        )
      : ListView.builder(
          itemCount: songList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ListTile(
                  title: Text(
                    (songList[index].title == null
                        ? 'Song title is not provided'
                        : songList[index].title!)!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Scale: ${songList[index].scale ?? ' '}'),
                        const SizedBox(
                          width: 35,
                        ),
                        Text('Marefiya  : ${songList[index].marefiya ?? ' '}'),
                        const SizedBox(
                          width: 35,
                        ),
                        Text(
                            'Transpose  : ${songList[index].transpose ?? ' '}'),
                      ],
                    ),
                  ),
                  onTap: () =>
                      Get.toNamed('/detail', arguments: songList[index]),
                ),
              ),
            );
          },
        );
}
