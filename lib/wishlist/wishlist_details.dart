import 'package:flutter/material.dart';
import 'package:kuul/my_provider.dart';
import 'package:provider/provider.dart';

class WishlistDetails extends StatefulWidget {
  final String name;
  final String pic;
  final Map<String, dynamic> item;
  const WishlistDetails(
      {super.key, required this.name, required this.pic, required this.item});

  @override
  State<WishlistDetails> createState() => _WishlistDetailsState();
}

class _WishlistDetailsState extends State<WishlistDetails> {
  void deleteBook() {
    Provider.of<MyProvider>(context, listen: false).removeWishlist(widget.item);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: 
          Text("Item removed from Wishlist", style: TextStyle(color: Colors.amber),),
          backgroundColor: Colors.black,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            widget.pic,
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () => deleteBook(),
            color: Colors.red,
            minWidth: 10,
            child: const Text(
              "Click to Delete",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
