import 'package:flutter/material.dart';
import 'package:water_tracker/settings.dart';
import 'package:water_tracker/splash.dart';
import 'package:water_tracker/tracking.dart';
import 'initial.dart';

void main() {
  runApp(const WaterTracker());
}

class WaterTracker extends StatelessWidget {
  const WaterTracker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: InitialSet.id,
      routes: {
        Splash.id: (context) => const Splash(),
        InitialSet.id: (context) => const InitialSet(),
        Tracking.id: (context) => const Tracking(),
        Settings.id: (context) => const Settings(),
      },
    );
}

}
