import 'package:flutter/material.dart';
import 'package:notes_app/note_class.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key key, this.note, this.isNew = false}) : super(key: key);

  final Note note;
  final bool isNew;
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
    if(!widget.isNew) {
      _titleController = TextEditingController(
          text: widget.note.title);
      _noteContentController = TextEditingController(
          text: widget.note.noteContent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            // for title
            TextField(
              controller: _titleController,
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
              controller: _noteContentController,
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
