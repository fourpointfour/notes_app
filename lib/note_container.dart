import 'package:flutter/cupertino.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pattern.png'),
          colorFilter: ColorFilter.srgbToLinearGamma(),
          alignment: Alignment(1.1, -2),
          // fit: BoxFit.fill,
        ),
        color: Color(0xffffe598),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: ListTile(
        onTap: () async {
          Navigator.pushNamed(context, '/openNote', arguments: {
            '_title': widget.title,
            '_content': widget.noteContent,
            'index': widget.index,
          });
        },
        // todo: do something to delete the note
        // trailing: IconButton(
        //   icon: Icon(Icons.delete),
        //   iconSize: 12,
        //   onPressed: () {
        //     return showDialogBox(context, widget.index);
        //   },
        // ),
        contentPadding: EdgeInsets.only(left: 8, right: 6, top: 4, bottom: 3),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xff4d5284),
          ),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            widget.noteContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
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