import 'package:flutter/material.dart';

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {

  void pushChange(int containerSize, int goal) {
    var containerSize;
    var goal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water TrackR'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
          child: Text(
        'The form will come here soon',
        style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
      )),
    );
  }
}
