import 'package:flutter/material.dart';
import 'initial.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  bool isPressed = false;

  IconButton _buildIconButton() {
    return IconButton(
        icon: (isPressed)
            ? Icon(Icons.water_drop)
            : Icon(Icons.water_drop_outlined),
        color: Colors.blueAccent[200],
        iconSize: 55.0,
        onPressed: () => onTap());
  }

  Row _buildRow(int g, int c) {
    List<IconData> bottles = <IconData>[];
    for (var i = 0; i < g ~/ c; i++) {
      bottles.add(Icons.water_drop_outlined);
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildIconButton()
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
