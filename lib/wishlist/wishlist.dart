import 'package:flutter/material.dart';
import 'package:kuul/drawer.dart';
import 'package:kuul/Wishlist/Wishlist_details.dart';
import 'package:kuul/my_provider.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatefulWidget {
  final String name;
  final String email;
  const Wishlist({super.key, required this.name, required this.email});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MyProvider>(context).wishlist;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      drawer: MyDrawer(name: widget.name, email: widget.email),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('below are books added to your Wishlist'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) => WishlistDetails(
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
