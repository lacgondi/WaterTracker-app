import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {
  TextEditingController goalController = new TextEditingController();
  TextEditingController containerController = new TextEditingController();

  int? goal;
  int? containerSize;

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
                    containerSize = int.parse(value);
                    return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    goal = int.parse(goalController.text);
                    containerSize = int.parse(containerController.text);
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
