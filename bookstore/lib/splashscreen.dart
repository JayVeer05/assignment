import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),
        () => Navigator.pushReplacementNamed(context, "/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade100,
      child: Center(
        child: Image.asset(
          "assets/images/book.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
