import 'package:app_project/HomePage.dart';
import 'package:app_project/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: new ListView(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(color: Colors.teal.shade300),
            width: 500,
            height: 150,
            child: Text(
              'MU CAFE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  height: 2),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),),
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
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
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      hintText: 'Password'),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal.shade300,
                  onPrimary: Colors.white,
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              child: Text('Log In'),
              onPressed: () async {
                signIn();
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'Don\'t have an account?',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                style: TextStyle(color: Colors.teal.shade300))
          ])))
        ],
      ),
    );
  }

  Future signIn() async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print(e);
      _email = "";
      _password = "";
    }
  }
}
