import 'package:flutter/material.dart';
import 'package:kuul/drawer.dart';
import 'package:kuul/library/library_details.dart';
import 'package:kuul/my_provider.dart';
import 'package:provider/provider.dart';

class Library extends StatefulWidget {
  final String name;
  final String email;
  const Library({super.key, required this.name, required this.email});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MyProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Library",
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: MyDrawer(name: widget.name, email: widget.email),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('below are books added to your library'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) => LibraryDetails(
                    name: cart[index]['title'].toString(),
                    pic: cart[index]['img'].toString(),
                    item: cart[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
