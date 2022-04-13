import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writestyle/pages/music_theory/index.dart';
import 'package:writestyle/pages/song_type/type_controller.dart';

import './pages/splash.dart';
import './pages/edit.dart';
import './pages/about.dart';
import 'pages/add_details.dart';
import './pages/details.dart';
import './pages/home.dart';
import 'pages/tab_controller.dart';
import './pages/favorite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      getPages: [
        GetPage(
          name: '/about',
          page: () => const AboutPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/detail',
          page: () => DetailsPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/learn_music',
          page: () => const Index(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/addSong',
          page: () => const AddSongPage(),
          transition: Transition.upToDown,
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/edit',
          page: () => EditSong(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/style',
          page: () => const TabsController(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/type',
          page: () => const TypeController(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
            name: '/favorite',
            page: () => const Favorite(),
            transition: Transition.native),
      ],
    );
  }
}
