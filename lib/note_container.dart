import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/note_class.dart';

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
        tileColor: Colors.blue[300],
        onTap: () async {
          Navigator.pushNamed(context, '/openNote', arguments: {
            '_title': widget.title,
            '_content': widget.noteContent,
            'index': widget.index,
          });
        },
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            return showDialogBox(context, widget.index);
          },
        ),
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

Future<dynamic> showDialogBox(BuildContext context, int index)
{
  final box = Hive.box<Note>('noteBox');
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Confirm?"),
      content: Text("Are you sure you want to delete this?"),
      actions: [
        TextButton(
          child: Text("Delete"),
          onPressed: () {
            box.deleteAt(index);
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    ),
  );
}