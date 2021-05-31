import 'package:flutter/material.dart';

class NoteContainer extends StatefulWidget {
  const NoteContainer({Key key, this.title, this.noteContent, this.timeModified, this.index}) : super(key: key);

  final String title;
  final String noteContent;
  final DateTime timeModified;
  final index;

  @override
  _NoteContainerState createState() => _NoteContainerState();
}

class _NoteContainerState extends State<NoteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () async {
          Navigator.pushNamed(context, '/openNote', arguments: {
            '_title': widget.title,
            '_content': widget.noteContent,
            'index': widget.index,
          });
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
