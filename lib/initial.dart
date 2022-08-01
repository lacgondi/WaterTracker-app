import 'dart:core';
import 'package:flutter/material.dart';

class InitialSet extends StatefulWidget {
  const InitialSet({super.key});

  @override
  State<InitialSet> createState() => InitialSetState();
}

class InitialSetState extends State<InitialSet> {

  void pushChange(int containerSize, int goal) {
    var containerSize;
    var goal;
  }

  Form _initalSet() {
    final _formKey = GlobalKey<FormState>();

    return Form(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(18.0),
                child: TextFormField(
                    enableInteractiveSelection: false,
                    decoration:
                        InputDecoration(labelText: "Water drinking goal"),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next)),
            Padding(
                padding: EdgeInsets.all(18.0),
                child: TextFormField(
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(labelText: "Container size"),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next)),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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
