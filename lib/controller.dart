// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              // First Page
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'First Page',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
              ),
              // Second Page
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Second Page',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  )
                )
              ),
              // Third Page
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Third Page',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  )
                ),
              ),
            ],
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPageIndex == i
                          ? Colors.lightBlue.shade300
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
