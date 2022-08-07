import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tracking.dart';

//Global variables
int goal = 0;
int containerSize = 0;

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {
  TextEditingController goalController = new TextEditingController();
  TextEditingController containerController = new TextEditingController();

  void loadCounter() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    setState(() {
      goal = storage.getInt('goal') ?? 0;
      containerSize = storage.getInt('containerSize') ?? 0;
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
      goal = value1;
      storage.setInt('goal', goal);
      containerSize = value2;
      storage.setInt('containerSize', containerSize);
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
                decoration: InputDecoration(labelText: "Water drinking goal"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
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
                decoration: InputDecoration(labelText: "Container size"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Tracking();
                    }));
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
