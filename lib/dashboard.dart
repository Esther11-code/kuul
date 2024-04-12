import 'package:flutter/material.dart';
import 'package:kuul/details.dart';
import 'package:kuul/drawer.dart';
import 'package:kuul/data/data.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String email;
  const Dashboard({required this.name, required this.email, super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> filters = const [
    'Adventures',
    'Romance',
    'Horror',
    'Thriller'
  ];

  late String selectedFilter = filters[0];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hi ${widget.name}',
          style: TextStyle(color: Colors.amber[400]),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
              color: Colors.amber[400],
            );
          },
        ),
      ),
      drawer: MyDrawer(name: widget.name, email: widget.email),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Top Selling....',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  topSellers(books[0]['img'].toString()),
                  topSellers(books[1]['img'].toString()),
                  topSellers(books[2]['img'].toString()),
                  topSellers(books[3]['img'].toString()),
                  topSellers(books[4]['img'].toString()),
                  topSellers(books[5]['img'].toString()),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Colors.amber[400]
                              : Colors.white,
                          side: const BorderSide(color: Colors.amber),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          label: Text(filter),
                          labelStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return bookDetails(
                      book['img'].toString(),
                      book['title'].toString(),
                      book,
                    );
                  }),
            )
          ])),
    );
  }

  Image topSellers(String bookName) => Image.asset(
        bookName,
        width: 120,
        height: 120,
      );
  Widget bookDetails(String pic, String name, Map details) => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              pic,
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          BookCard(book: details)),
                );
              },
              color: Colors.amber[400],
              minWidth: 50,
              child: const Text(
                'Click to view',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );
}
