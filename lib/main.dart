import 'package:flutter/material.dart';
import 'package:notes_app/add_note.dart';
import 'package:notes_app/my_notes_app.dart';

void main()
{
  runApp(MaterialApp(
    routes: {
      '/': (context) => MyNotesApp(),
      '/addNote': (context) => AddNote(),
    },
  ));
}