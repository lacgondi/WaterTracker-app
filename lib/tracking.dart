import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:water_tracker/settings.dart';
import 'initial.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Global variables
int _counter = 0;
int _goalTracked = 0;
int _containerTracked = 0;

class Tracking extends StatefulWidget {
  const Tracking({super.key});
  static const String id = "/trackingPage";

  State<Tracking> createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  Widget _buildSettingsButton() {
    return IconButton(
        onPressed: () => Navigator.pushNamed(context, Settings.id),
        icon: Icon(Icons.settings));
  }

  Widget _statusUpdater() {
    return Text(
        "Hello you've drank $_counter ml out of $_goalTracked ml today.");
  }

  Widget _buildIconButton() {
    return IconButton(
        icon: Icon(Icons.water_drop_outlined),
        color: Color.fromARGB(255, 68, 171, 255),
        iconSize: 55.0,
        onPressed: () => _onTap());
  }

  Widget _buildReset() {
    return OutlinedButton(
      onPressed: () => _reset(),
      child: Text('Reset counter'),
    );
  }

  Widget _buildColumn(int g, int c) {
    loadCounter();
    return Column(
      children: <Widget>[
        Align(alignment: Alignment.topCenter, child: _statusUpdater()),
        Align(alignment: Alignment.center, child: _buildIconButton()),
        Align(alignment: Alignment.bottomCenter, child: _buildReset())
      ],
    );
  }

  void loadCounter() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _counter = storage.getInt('counter') ?? 0;
      _goalTracked = storage.getInt('goal') ?? 0;
      _containerTracked = storage.getInt('containerSize') ?? 0;
    });
  }

  //todo check time and date on open

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void _onTap() async {
    //todo store time and date added
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _counter = (storage.getInt('counter') ?? 0) + _containerTracked;
      storage.setInt('counter', _counter);
    });
  }

  void _reset() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      storage.setInt('counter', _counter);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking'),
        actions: <Widget>[_buildSettingsButton()],
      ),
      body: _buildColumn(_goalTracked, _containerTracked),
    );
  }
}
