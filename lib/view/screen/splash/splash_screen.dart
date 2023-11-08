import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_d_anurag_1786/view/screen/login/login_screen.dart';
import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 6),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
            height: 300,
            child: Image.asset("assets/image/splash_screen_image.gif")),
      ),
    );
  }
}
