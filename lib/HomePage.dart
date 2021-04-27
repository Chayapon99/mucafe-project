import 'dart:async';

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
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            'MU CAFE',
            style: GoogleFonts.openSans(),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80,
              child: DrawerHeader(
                child: Text(
                  'MENU',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
            ),
            ListTile(
              title: Text('Home', style: TextStyle(fontSize: 14),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search', style: TextStyle(fontSize: 14),),
              onTap: () {},
            ),
            ListTile(
              title: Text('Contact us', style: TextStyle(fontSize: 14),),
              onTap: () {},
            ),
          ],
        ),
      ),
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
        padding: EdgeInsets.all(24.0),
        children: <Widget>[
          Text(
            'Recommended Cafe',
            style: TextStyle(fontSize: 24),
          ),
          Padding(padding: EdgeInsets.only(bottom: 12.0)),
          SizedBox(
            height: 1.0,
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.teal)),
          ),
          ListTile()
        ],
      ),
    );
  }
}