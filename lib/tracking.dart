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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: 'Hello,',
                style: Theme.of(context).textTheme.headline1,
                children: <TextSpan>[
                  TextSpan(
                    text: "\nyou've drank",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextSpan(
                      text: "\n$_counter ml out of $_goalTracked ml today.",
                      style: Theme.of(context).textTheme.headlineSmall)
                ]),
            textAlign: TextAlign.center),
        // Text("Hello you've drank $_counter ml out of $_goalTracked ml today."),
      ],
    );
  }

  Widget _buildIconButton() {
    //todo label under
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
        icon: Icon(Icons.water_drop_outlined),
        color: Color.fromARGB(255, 68, 171, 255),
            iconSize: 100,
            onPressed: () => _onTap())
      ],
    );
  }

  Widget _buildReset() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => _reset(),
          child: const Text('Reset counter'),
        ),
      ],
    );
  }

  Widget _buildColumn(int g, int c) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _statusUpdater(),
          Expanded(
            child: _buildIconButton(),
          ),
          _buildReset(),
        ],
      ),
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
