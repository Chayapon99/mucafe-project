import 'dart:async';

import 'package:app_project/DrawerPage.dart';
import 'package:app_project/MapPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () => createDialog(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: Center(
          child: Text(
            'MU CAFE',
            style: GoogleFonts.openSans(),
          ),
        ),
      ),
      drawer: DrawerPage(),
      body: HomeScreen(),
    );
  }

  createDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Welcome to\nMU CAFE'),
            elevation: 24.0,
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListTile(
            title: Text(
              'Recommended Cafe',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 8.0)),
          SizedBox(
            height: 1.0,
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade400)),
          ),
          SizedBox(
            height: 24,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapPage()));
            },
            child: Text(
              'Click here to see the cafes nearby Mahidol University',
              style: TextStyle(color: Colors.teal.shade300),
            ),
          )
        ],
      ),
    );
  }
}
