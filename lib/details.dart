import 'package:flutter/material.dart';
import 'package:kuul/my_provider.dart';
import 'package:provider/provider.dart';

class BookCard extends StatefulWidget {
  final Map book;
  const BookCard({super.key, required this.book});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  // add to library
  void addCart() {
    Provider.of<MyProvider>(context, listen: false).addCart({
      'img': widget.book['img'],
      'title': widget.book['title'],
      'author': widget.book['author'],
      'year': widget.book['year'],
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'added to library',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  // add to wishlist
  void addList() {
    Provider.of<MyProvider>(context, listen: false).addWishlist({
      'img': widget.book['img'],
      'title': widget.book['title'],
      'author': widget.book['author'],
      'year': widget.book['year'],
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'added to wishlist',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Details',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                widget.book['img'],
                height: 150,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                widget.book['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.book['author'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.book['year'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () => addCart(),
              color: Colors.amber[400],
              minWidth: double.infinity,
              child: const Text(
                'Add To Library',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () => addList(),
              color: Colors.black,
              minWidth: double.infinity,
              child: const Text(
                'Add To Wishlist',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
