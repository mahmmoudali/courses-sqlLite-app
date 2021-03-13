import 'dart:io';

String NAME = 'name', CONTENT = 'content', ID = 'id', HOURS = 'hours';

class Course {
  int _id, _hours;
  String _name, _content;

  Course(dynamic obj) {
    _id = obj['$ID'];
    _name = obj['$NAME'];
    _content = obj['$CONTENT'];
    _hours = obj['$HOURS'];
  }
  Course.fromMap(Map<String, dynamic> data) {
    _id = data['$ID'];
    _name = data['$NAME'];
    _content = data['$CONTENT'];
    _hours = data['$HOURS'];
  }
  Map<String, dynamic> toMap() {
    return {
      '$ID': _id,
      '$NAME': _name,
      '$CONTENT': _content,
      '$HOURS': _hours,
    };
  }

  int get id => _id;
  int get hours => _hours;
  String get name => _name;
  String get content => _content;
}
