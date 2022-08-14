import 'package:flutter/material.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_tracker/tracking.dart';



class Settings extends StatefulWidget {
  const Settings({super.key});
  static const id = "/settings";

  @override
  State<Settings> createState() => SettingsSetState();
}


class SettingsSetState extends State<Settings> {
  TextEditingController _goalsettingC = TextEditingController();
  TextEditingController _containerSettingC = TextEditingController();

  int _goalsetting = 0;
  int _containerSetting = 0;

  void loadSettings() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _goalsetting = storage.getInt('goal') ?? 0;
      _containerSetting = storage.getInt('containerSize') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  void saveSettings() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      if (_goalsettingC.text == null || _goalsettingC.text == '') {
      } else {
        _goalsetting = int.parse(_goalsettingC.text);
        storage.setInt('goal', _goalsetting);
      }
      if (_containerSettingC.text == null || _containerSettingC.text == '') {
      } else {
        _containerSetting = int.parse(_containerSettingC.text);
        storage.setInt('containerSize', _containerSetting);
      }
    });
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: TextField(
              controller: _goalsettingC,
              enableInteractiveSelection: false,
              decoration:
                  InputDecoration(
                  labelText: "Change water intake goal",
                  hintText: '$_goalsetting',
                  suffixText: 'ml'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            )),
        Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: TextField(
              controller: _containerSettingC,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                  labelText: "Change container size",
                  hintText: '$_containerSetting',
                  suffixText: 'ml'),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            )),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: ElevatedButton(
            onPressed: () {
              saveSettings();
              Navigator.pushReplacementNamed(context, Tracking.id);
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: _buildBody(),
    );
  }
}
