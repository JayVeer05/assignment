// ignore_for_file: prefer_const_constructors

import 'package:bookstore/homepage.dart';
import 'package:bookstore/login.dart';
import 'package:bookstore/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: "/splash",
      routes: {
        "/": (context) => Homepage(),
        "/home": (context) => Homepage(),
        "/splash": (context) => SplashScreen(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
