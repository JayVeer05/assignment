import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.purple.shade100,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Jayveer",
                  style: TextStyle(fontSize: 20),
                ),
                accountEmail: Text(
                  "jayveerdalwadi05@gmail.com",
                  style: TextStyle(fontSize: 20),
                ),
                decoration: BoxDecoration(color: Colors.purple.shade300),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.kindpng.com/picc/m/490-4904536_user-3d-icon-png-transparent-png.png"),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.indigo),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.settings, color: Colors.indigo),
                title: Text(
                  "settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.person, color: Colors.indigo),
                title: Text(
                  "person",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
