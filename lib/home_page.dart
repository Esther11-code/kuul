// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kuul/dashboard.dart';
import 'package:kuul/my_provider.dart';
import 'package:kuul/register_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (email.text == '' || password.text == '') {
      myAlert('all fields are required');
    }

    final users = Provider.of<MyProvider>(context, listen: false).users;

    for (var user in users) {
      if (user['email'] == email.text && user['password'] == password.text) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                Dashboard(name: user['fullname'], email: user['email'])));
        return;
      }
    }
    myAlert('user does not exist');

    setState(() {
      email.text = '';
      password.text = '';
    });
  }

  void myAlert(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('message: $msg'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    )); //snack
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KUUL",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amber[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: 'User ', style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.amber[400])),
                    ]),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: 'enter email', icon: Icon(Icons.email)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'enter password', icon: Icon(Icons.password)),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () => login(),
              color: Colors.amber[400],
              minWidth: double.infinity,
              child: Text('Login Now', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const RegisterPage(),
                ),
              ),
              child: Text('not yet a member? click here to register'),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String label, icon) => InputDecoration(
      hintText: label,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      prefixIcon: icon,
      prefixIconColor: Colors.amber[400],
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.amber),
        borderRadius: BorderRadius.circular(5)
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ));
}
