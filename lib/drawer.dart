import 'package:flutter/material.dart';
import 'package:kuul/dashboard.dart';
import 'package:kuul/home_page.dart';
import 'package:kuul/library/library.dart';
import 'package:kuul/wishlist/wishlist.dart';

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
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Dashboard(name: name, email: email))),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text(
              'My Library',
              style: TextStyle(color: Colors.amber),
            ),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Library(name: name, email: email))),
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
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Wishlist(name: name, email: email))),
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
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage())),
          ),
        ],
      ),
    );
  }
}
