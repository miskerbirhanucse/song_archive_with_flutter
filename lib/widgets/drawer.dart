import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writestyle/pages/favorite.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(right: 15),
        children: [
          const DrawerHeader(
            padding: EdgeInsets.only(right: 30),
            margin: EdgeInsets.only(right: 40,left: 20,top: 50),
            child: Text(''),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/abc.png'), fit: BoxFit.fill)),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Get.toNamed('/home');
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.local_library,
            ),
            title: const Text('Learn Music'),
            onTap: () {
              Get.toNamed('/learn_music');
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.library_music,
            ),
            title: const Text('Song Type'),
            onTap: () {
              Get.offNamed('/type');
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.music_note,
            ),
            title: const Text('Style'),
            onTap: () {
              Get.offNamed('/style');
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.favorite,
            ),
            title: const Text('Favorite Songs'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Favorite(),
                ),
              );
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
            ),
            title: const Text('About'),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
          _buildDivider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Exit'),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 0.5,
    );
  }
}
