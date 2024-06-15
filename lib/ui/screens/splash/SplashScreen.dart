import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SplashScreen.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
