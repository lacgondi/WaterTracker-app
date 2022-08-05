import 'package:flutter/material.dart';
import 'initial.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {


  bool isPressed = false;

  Row _buildRow(int g, int c) {
    List<IconData> bottles = <IconData>[];
    for (var i = 0; i < g ~/ c; i++) {
      bottles.add(Icons.water_drop_outlined);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (var item in bottles)
            IconButton(
                icon: (isPressed) ? Icon(item) : Icon(Icons.water_drop),
                color: Colors.blueAccent[200],
                iconSize: 55.0,
                onPressed: () => onTap()),
        ]);
  }

  void onTap() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
      ),
      body: _buildRow(goal, containerSize),
    );
  }
}
