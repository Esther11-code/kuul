import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String name;
  final String email;
  const MyDrawer({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text(
            'Kuul App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.amber[400],
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.amber[400],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            title: const Text(
              'Store',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'My Library',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Search',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'My Wishlist',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'My Profile',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
