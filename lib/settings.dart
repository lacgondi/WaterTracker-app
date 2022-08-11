import 'package:flutter/material.dart';
import 'dart:core';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const id = "/settings";

  @override
  State<Settings> createState() => SettingsSetState();
}

Widget _buildBody() {
  return Text('soon');
}

class SettingsSetState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: _buildBody(),
    );
  }
}
