import 'package:flutter/material.dart';
import 'initial.dart';

void main() {
  runApp(const WaterTracker());
}

class WaterTracker extends StatelessWidget {
  const WaterTracker({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       home: InitialSet()
    );
}

}
