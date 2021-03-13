import 'package:flutter/material.dart';
import 'package:sql_lite_app/DB/db_helper.dart';
import 'package:sql_lite_app/components/TextFieldForm.dart';
import 'package:sql_lite_app/model/course.dart';


class NewCourse extends StatefulWidget {
  final String routeName = '/new_course';
  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name, content;
  DbHelper dbHelper;
  int hours;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADD COURSE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/a-class.png',
                  scale: 1,
                  color: Color(0xFFFF5A5F),
                ),
                SizedBox(height: 20),
                Form(
                    child: Column(
                  children: [
                    BuildTextFromFeild(
                      hint: 'Enter course name',
                      label: 'Course name',
                      icon: Icons.label_outlined,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    BuildTextFromFeild(
                        onChanged: (value) {
                          setState(() {
                            content = value;
                          });
                        },
                        maxLines: 5,
                        hint: 'Enter course content',
                        label: 'Description',
                        icon: Icons.line_style_rounded),
                    SizedBox(height: 30),
                    BuildTextFromFeild(
                      textInputType: TextInputType.number,
                      icon: Icons.alarm_on,
                      hint: 'Enter number of hours',
                      label: 'Hours',
                      onChanged: (value) {
                        setState(() {
                          hours = int.parse(value);
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    BuildTextFromFeild(
                      textInputType: TextInputType.number,
                      icon: Icons.auto_awesome,
                      hint: 'Enter level of course',
                      label: 'Level',
                      onChanged: (value) {
                        setState(() {
                          hours = int.parse(value);
                        });
                      },
                    ),
                  ],
                )),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: RaisedButton(
                    color: Color(0xFFFF5A5F),
                    onPressed: () async {
                      if (name == null || content == null || hours == null) {
                        name = 'Default Course';
                        content = 'Default Content';
                        hours = 00;
                      }
                      Course course = Course({
                        '$NAME': name,
                        '$CONTENT': content,
                        '$HOURS': hours
                      });
                      await dbHelper.createCourse(course);
                      Navigator.of(context).pop();
                    },
                    child: Text('Submit Course',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
