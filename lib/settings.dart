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
  TextEditingController goalSettingC = TextEditingController();
  TextEditingController containerSettingC = TextEditingController();

  int goalSetting = 0;
  int containerSetting = 0;

  void loadSettings() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      goalSetting = storage.getInt('goal') ?? 0;
      containerSetting = storage.getInt('containerSize') ?? 0;
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
      if (goalSettingC.text == null || goalSettingC.text == '') {
      } else {
        goalSetting = int.parse(goalSettingC.text);
        storage.setInt('goal', goalSetting);
      }
      if (containerSettingC.text == null || containerSettingC.text == '') {
      } else {
        containerSetting = int.parse(containerSettingC.text);
        storage.setInt('containerSize', containerSetting);
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
              controller: goalSettingC,
              enableInteractiveSelection: false,
              decoration:
                  InputDecoration(labelText: "Change water intake goal"),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            )),
        Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: TextField(
              controller: containerSettingC,
              enableInteractiveSelection: false,
              decoration: InputDecoration(labelText: "Change container size"),
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
