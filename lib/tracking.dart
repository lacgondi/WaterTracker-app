import 'package:flutter/material.dart';
import 'initial.dart';

//Global variables
int counter = 0;

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  Widget _statusUpdater() {
    return Text("Hello you've drank $counter ml out of $goal ml today.");
  }

  Widget _buildIconButton() {
    return IconButton(
        icon: Icon(Icons.water_drop_outlined),
        color: Color.fromARGB(255, 68, 171, 255),
        iconSize: 55.0,
        onPressed: () => onTap());
  }

  Widget _buildColumn(int g, int c) {
    return Column(
      children: <Widget>[
        Align(alignment: Alignment.topCenter, child: _statusUpdater()),
        Align(alignment: Alignment.center, child: _buildIconButton()),
      ],
    );
  }

  void onTap() {
    setState(() {
      counter += containerSize;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: _buildColumn(goal, containerSize),
    );
  }
}
