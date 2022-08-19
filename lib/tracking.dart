import 'package:flutter/material.dart';
import 'package:water_tracker/settings.dart';
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
                    style: Theme.of(context).textTheme.headlineSmall,
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
            padding: EdgeInsets.fromLTRB(0, 225, 0, 10),
        icon: Icon(Icons.water_drop_outlined),
        color: Color.fromARGB(255, 68, 171, 255),
            iconSize: 100,
            onPressed: () => _onTap()),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_buildSettingsButton()],
          ),
          _statusUpdater(),
          _buildIconButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: 'press if have drank $_containerTracked ml',
                    style: Theme.of(context).textTheme.labelSmall),
              ),
            ],
          )
          
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
  // void loadDate() async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   setState(() {
  //     storage.getInt('day') ?? DateTime.now().day;
  //   });
  // }

  // void checkDate() async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   if (storage.getInt('day') != DateTime.now().day) {
  //     setState(() {
  //       storage.setInt('day', DateTime.now().day);
  //       _reset();
  //     });
  //   } else {}
  // }

  @override
  void initState() {
    super.initState();
    loadCounter();
    // loadDate();
  }

  void _onTap() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildColumn(_goalTracked, _containerTracked),
    );
  }
}
