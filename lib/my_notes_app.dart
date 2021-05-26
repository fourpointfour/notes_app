import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/note_class.dart';
import 'package:notes_app/note_container.dart';

class MyNotesApp extends StatefulWidget {
  const MyNotesApp({Key key}) : super(key: key);

  @override
  _MyNotesAppState createState() => _MyNotesAppState();
}

class _MyNotesAppState extends State<MyNotesApp> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

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
        body: ValueListenableBuilder(
          valueListenable: Hive.box<Note>('noteBox').listenable(),
          builder: (context, Box<Note> _box, _) {
            return ListView.builder(
              itemCount: _box.values.length,
              itemBuilder: (context, index) {
                final _boxData = _box.getAt(index);
                return NoteContainer(
                  title: _boxData.title,
                  noteContent: _boxData.noteContent,
                  timeModified: _boxData.timeModified,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
