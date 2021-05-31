import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/add_note.dart';
import 'package:notes_app/my_notes_app.dart';
import 'package:notes_app/note_class.dart';
import 'package:notes_app/open_note.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('noteBox');

  runApp(MaterialApp(
    routes: {
      '/': (context) => MyNotesApp(),
      '/addNote': (context) => AddNote(),
      '/openNote': (context) => OpenNote(),
    },
  ));
}