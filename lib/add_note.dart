import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/note_class.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String _title;
  String _content;
  TextEditingController _titleController;
  TextEditingController _noteContentController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check_circle),
          onPressed: () {
            if(_title == null || _content == null || _title.isEmpty || _content.isEmpty) {
              print('Note empty...');
              return;
            }
            final Note note = Note(title: _title, noteContent: _content, timeModified: DateTime.now());
            try {
              var box = Hive.box<Note>('noteBox');
              box.add(note);
              print('Data written successfully');
              Navigator.pop(context);
            } catch (err) {
              print(err.toString());
            }
          },
        ),
        body: ListView(

          children: [
            // for title
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                suffix: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    // do something to save the note
                    // add null checks too
                  },
                )
              ),
              onChanged: (value) {
                _title = value;
              },
            ),
            // for note content
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your content',
                border: InputBorder.none,
              ),
              maxLines: null,
              onChanged: (value) {
                _content = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
