import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'tracking.dart';

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

  

  final LocalStorage storage = new LocalStorage('initStored.json');
  void saveToLocal(String key1, int value1, String key2, int value2) {
    storage.setItem(key1, value1);
    storage.setItem(key2, value2);
    goal = value1;
    containerSize = value2;
    // final info = jsonEncode({'name': 'Darush', 'family': 'Roshanzami'});
    // storage.setItem('info', info);
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
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );
                    saveToLocal('goal', int.parse(goalController.text),
                        'containerSize', int.parse(containerController.text));
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
