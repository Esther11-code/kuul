import 'package:flutter/material.dart';
import 'package:kuul/home_page.dart';
import 'package:kuul/my_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void regUser() {
    if (fname.text.isEmpty || email.text.isEmpty || password.text.isEmpty) {
      myAlert('Please fill all the fields');
    } 

    Provider.of<MyProvider>(context, listen: false).addUser({
      'fullname': fname.text,
      'email': email.text,
      'password': password.text
    });

    myAlert('account created successfully');



    setState(() {
      fname.text = '';
      email.text = '';
      password.text = '';
    });
  }

  void myAlert(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        // backgroundColor: Colors.amber[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kuul',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      const TextSpan(
                          text: 'User', style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(color: Colors.amber[400])),
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: fname,
              decoration: decoration('enter User', const Icon(Icons.person)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: email,
              decoration: decoration('enter email', const Icon(Icons.email)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration:
                  decoration('enter password', const Icon(Icons.password)),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                return regUser();
              },
              color: Colors.amber[400],
              minWidth: double.infinity,
              child: const Text(
                'Register Now',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('already a member? click here to register')),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String label, icon) {
    return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(
        color: Colors.black,
      ),
      prefixIcon: icon,
      prefixIconColor: Colors.amber[400],
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.amber, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber[400]!, width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
