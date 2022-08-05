import 'package:flutter/material.dart';
import 'initial.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  Row _buildRow(int g, int c) {
    List<IconData> bottles = <IconData>[];
    for (var i = 0; i < g ~/ c; i++) {
      bottles.add(Icons.water_drop_outlined);
    }
    return Row(children: <Widget>[for (var item in bottles) Icon(item)]);
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
