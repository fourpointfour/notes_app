import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String _title;
  String _content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    // todo: remove the following print statement
                    print(_content);
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
