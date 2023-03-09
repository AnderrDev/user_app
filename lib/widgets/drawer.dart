import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/profile_screen.dart';

class DrawerF extends StatelessWidget {
  const DrawerF({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
        ],
      ),
    );
  }
}
