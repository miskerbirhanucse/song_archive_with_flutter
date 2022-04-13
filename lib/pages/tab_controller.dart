import 'package:flutter/material.dart';
import 'package:writestyle/pages/style/pop.dart';
import 'package:writestyle/pages/style/six_eight.dart';

import 'style/disco.dart';
import 'style/reggae.dart';
import 'style/slowrock.dart';
import 'style/waltz.dart';
import 'style/wello.dart';
import '../widgets/drawer.dart';

class TabsController extends StatelessWidget {
  const TabsController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Styles'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Waltz',
              ),
              Tab(
                text: 'Wollo',
              ),
              Tab(
                text: 'Disco',
              ),
              Tab(
                text: 'SlowRock',
              ),
              Tab(
                text: 'Reggae',
              ),
              Tab(
                text: 'Pop',
              ),
              Tab(
                text: '6-8',
              ),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        body: const TabBarView(
          children: [
            Waltz(),
            Wello(),
            Disco(),
            SlowRock(),
            Reggae(),
            Pop(),
            SixEight(),
          ],
        ),
      ),
    );
  }
}
