import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracker/initial.dart';
import 'package:water_tracker/tracking.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const String id = "/splash";

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  Future checkSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacementNamed(context, Tracking.id);
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushNamed(context, InitialSet.id);
    }
  }

  @override
  void initState() {
    super.initState();
    checkSeen();
  }

  @override
  Widget build(context) {
    return MaterialApp();
  }
}

