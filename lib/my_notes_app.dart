import 'package:flutter/material.dart';

class MyNotesApp extends StatefulWidget {
  const MyNotesApp({Key key}) : super(key: key);

  @override
  _MyNotesAppState createState() => _MyNotesAppState();
}

class _MyNotesAppState extends State<MyNotesApp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Transform.scale(
            scale: 2,
            child: Icon(
              Icons.add,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/addNote');
          },
        ),
      ),
    );
  }
}
