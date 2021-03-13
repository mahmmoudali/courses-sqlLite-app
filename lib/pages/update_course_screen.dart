import 'package:flutter/material.dart';
import 'package:sql_lite_app/DB/db_helper.dart';
import 'package:sql_lite_app/components/TextFieldForm.dart';
import 'package:sql_lite_app/model/course.dart';

class CourseUpdate extends StatefulWidget {
  String routeName = '/course_update';
  @override
  _CourseUpdateState createState() => _CourseUpdateState();
}

class _CourseUpdateState extends State<CourseUpdate> {
  TextEditingController teName = new TextEditingController();
  TextEditingController teContent = new TextEditingController();
  TextEditingController teHours = new TextEditingController();
  DbHelper dbHelper;
  Course course;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    course = ModalRoute.of(context).settings.arguments;
    teName.text = course.name;
    teContent.text = course.content;
    teHours.text = course.hours.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Update'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildTextFromFeild(
                controller: teName,
                label: 'Course Name',
              ),
              TextField(
                controller: teContent,
                maxLines: null,
              ),
              TextField(
                controller: teHours,
              ),
              RaisedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    var upCourse = Course({
                      '$ID': course.id,
                      '$NAME': teName.text,
                      '$CONTENT': teContent.text,
                      '$HOURS': int.parse(teHours.text),
                    });
                    await dbHelper.courseUpdate(upCourse);
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
