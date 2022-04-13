import 'package:flutter/material.dart';
import 'package:writestyle/pages/song_type/yemesgana.dart';
import 'package:writestyle/pages/song_type/yemetsnanat.dart';
import 'package:writestyle/pages/song_type/yeneseha.dart';
import 'package:writestyle/pages/song_type/yetselot.dart';
import 'package:writestyle/widgets/drawer.dart';

class TypeController extends StatelessWidget {
  const TypeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Song Type'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Yetselot',
              ),
              Tab(
                text: 'Yeneseha',
              ),
              Tab(
                text: 'Yemesgana',
              ),
              Tab(
                text: 'Yemetsnanat',
              ),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        body: const TabBarView(
          children: [
            Yetselot(),
            Yeneseha(),
            Yemesgana(),
            Yemetsnanat(),
          ],
        ),
      ),
    );
  }
}
