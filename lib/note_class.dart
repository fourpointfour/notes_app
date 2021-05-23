import 'package:hive/hive.dart';

part 'note_class.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;

  @HiveField(1)
  String noteContent;

  @HiveField(2)
  DateTime timeModified;

  Note({this.title, this.noteContent, this.timeModified});
}