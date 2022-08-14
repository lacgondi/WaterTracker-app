import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tracking.dart';

//Global variables
int _goal = 0;
int _containerSize = 0;

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});
  static const String id = "/initialSet";

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {
  //Variables
  TextEditingController goalController = new TextEditingController();
  TextEditingController containerController = new TextEditingController();

  void loadCounter() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _goal = storage.getInt('goal') ?? 0;
      _containerSize = storage.getInt('containerSize') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void saveToLocal(int value1, int value2) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      _goal = value1;
      storage.setInt('goal', _goal);
      _containerSize = value2;
      storage.setInt('containerSize', _containerSize);
    });
  }

  Form _initalSet() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(18.0),
                child: TextFormField(
                controller: goalController,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Water drinking goal \*", suffixText: 'ml'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                      if (value == null || value.isEmpty) {
                    return 'Please enter your water intake goal';
                  }
                      return null;
                },
              ),
            ),
                    
            Padding(
                padding: EdgeInsets.all(18.0),
                child: TextFormField(
                controller: containerController,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Water bottle size \*", suffixText: 'ml'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                    return 'Please enter the capacity of your water bottle';
                  }
                    return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveToLocal(int.parse(goalController.text),
                        int.parse(containerController.text));
                    Navigator.pushReplacementNamed(context, Tracking.id);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water TrackR'),
        backgroundColor: Colors.teal,
      ),
      body: _initalSet(),
    );
  }
}
