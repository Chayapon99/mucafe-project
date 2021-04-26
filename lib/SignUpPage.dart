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
              ),
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
              ),
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
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () async {
                try {
                  User user = (await auth.createUserWithEmailAndPassword(
                          email: _email,
                          password: _password))
                      .user;
                  await user.updateProfile(displayName: _email);
                  final user1 = auth.currentUser;
                  if (user1 != null) {
                    Navigator.pop(context);
                  }
                } catch (e) {
                  print(e);
                  _email = "";
                  _password = "";
                }
              },
            ),
          ),
        ]));
  }
}
