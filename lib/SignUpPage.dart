import 'package:app_project/SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _confirmpassword;

  final auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your Account'),
          backgroundColor: Colors.teal.shade300,
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
                  obscureText: true,
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
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm a Password'),
                  onChanged: (value) {
                    setState(() {
                      _confirmpassword = value;
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
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade300,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero)),
              ),
              onPressed: () async {
                signUp();
              },
            ),
          ),
        ]));
  }

  Future signUp() async {
    try {
      if (_password == _confirmpassword && _password.length >= 6) {
        UserCredential user = await auth
            .createUserWithEmailAndPassword(
                email: _email.trim(), password: _password.trim())
            .catchError((err) {
          print(err.message);
        });
        if (user != null) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      }
    } catch (e) {
      print(e);
      _email = "";
      _password = "";
    }
  }
}
