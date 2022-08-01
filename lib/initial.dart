import 'package:flutter/material.dart';

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {
  final _formKey = GlobalKey<InitialSetState>();

  void pushChange(int containerSize, int goal) {
    var containerSize;
    var goal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Water Tracker')),
    );
  }
}
