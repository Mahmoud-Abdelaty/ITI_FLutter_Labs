import 'package:task_3/db/constants.dart';

class Note {
  int? id;
  String title = '';
  String text = '';
  String date = '';
  int color = 0;
  String upD = '';

  Note({
    this.id,
    required this.title,
    required this.text,
    required this.date,
    required this.color,
    required this.upD,
  });

  Map<String, dynamic> toMap() => {
        colId: id,
        colTitle: title,
        colText: text,
        colDate: date,
        colColor: color,
        colUpdateDate: upD,
      };

  Note.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    title = map[colTitle];
    text = map[colText];
    date = map[colDate];
    color = map[colColor] ?? 0;
    upD = map[colUpdateDate];
  }
}
