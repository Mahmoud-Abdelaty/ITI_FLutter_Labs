import 'package:flutter/material.dart';

const DB_NAME = 'note.db';
const DB_VERSION = 10;
const TABLE_NAME = 'notes';
const colId = 'noteId';
const colTitle = 'noteTitle';
const colText = 'noteText';
const colDate = 'noteDate';
const colColor = 'noteColor';
const colUpdateDate = 'UpdateDate';

List<int> colors = [
  Colors.blueGrey.value,
  Colors.yellow.value,
  Colors.indigo.value,
  Colors.green.value,
  Colors.lime.value
];
