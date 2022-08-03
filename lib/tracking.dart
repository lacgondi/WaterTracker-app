import 'package:flutter/material.dart';
import 'initial.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tracking')),
    );
  }
}
