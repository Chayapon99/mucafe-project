import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
              child: Text(
                'MENU',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(
              'Search',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text(
              'Contact us',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 300,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              signOut();
              Navigator.of(context).popUntil((route) => true);
            },
          )
        ],
      ),
    );
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
