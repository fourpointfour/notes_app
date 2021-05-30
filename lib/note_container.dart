import 'package:flutter/material.dart';

class NoteContainer extends StatefulWidget {
  const NoteContainer({Key key, this.title, this.noteContent, this.timeModified}) : super(key: key);

  final String title;
  final String noteContent;
  final DateTime timeModified;

  @override
  _NoteContainerState createState() => _NoteContainerState();
}

class _NoteContainerState extends State<NoteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          print('Note Box tapped!');
        },
        title: Text(widget.title),
        subtitle: Container(
          child: Text(
            widget.noteContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
