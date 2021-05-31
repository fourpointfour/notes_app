import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/note_class.dart';

class OpenNote extends StatefulWidget {
  const OpenNote({Key key}) : super(key: key);

  @override
  _OpenNoteState createState() => _OpenNoteState();
}

void updateDataAtIndex(String _title, String _content, int index) {
  try {
    final dataBox = Hive.box<Note>('noteBox');
    final Note note = Note(
      title: _title,
      noteContent: _content,
      timeModified: DateTime.now(),
    );
    dataBox.putAt(index, note);
  } catch (err) {
    print(err.toString());
  }
}

class _OpenNoteState extends State<OpenNote> {
  @override
  Widget build(BuildContext context) {
    var noteData = ModalRoute.of(context).settings.arguments as Map;
    String _title = noteData['_title'];
    String _content = noteData['_content'];
    final index = noteData['index'];
    TextEditingController titleController = TextEditingController(text: _title);
    TextEditingController contentController = TextEditingController(text: _content);
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            updateDataAtIndex(_title, _content, index);
            Navigator.pop(context);
            return false;
          },
          child: ListView(
            children: [
              // for title
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    suffix: IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        updateDataAtIndex(_title, _content, index);
                        Navigator.pop(context);
                      },
                    )
                ),
                onChanged: (value) {
                  _title = value;
                },
              ),
              // for note content
              TextField(
                controller: contentController,
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
      ),
    );
  }
}
