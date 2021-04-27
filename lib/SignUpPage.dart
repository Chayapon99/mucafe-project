import 'package:app_project/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your Account'),
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ),
        ),
        body: new ListView(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm a Password'),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () async {
                signUp();
              },
            ),
          ),
        ]));
  }

  Future signUp() async {
    try {
      UserCredential user = (await auth.createUserWithEmailAndPassword(
          email: _email.trim(), password: _password.trim()));
      if (user != null) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }
}
