import 'package:flutter/material.dart';
import 'package:sql_lite_app/DB/db_helper.dart';
import 'package:sql_lite_app/components/TextFieldForm.dart';
import 'package:sql_lite_app/model/course.dart';

class Up extends StatefulWidget {
  String routeName = '/up';
  @override
  _UpState createState() => _UpState();
}

class _UpState extends State<Up> {
  TextEditingController teName = new TextEditingController();
  TextEditingController teContent = new TextEditingController();
  TextEditingController teHours = new TextEditingController();
  String name, content;
  DbHelper dbHelper;
  Course course;
  int hours;

  @override
  void initState() {
    dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    course = ModalRoute.of(context).settings.arguments;
    teName.text = course.name;
    teContent.text = course.content;
    teHours.text = course.hours.toString();
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
                      controller: teName,
                      icon: Icons.label_outlined,
                    ),
                    SizedBox(height: 30),
                    BuildTextFromFeild(
                        controller: teContent,
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
                      controller: teHours,
                    ),
                    SizedBox(height: 30),
                  ],
                )),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: RaisedButton(
                    color: Color(0xFFFF5A5F),
                    onPressed: () async {
                      var upCourse = Course({
                        '$ID': course.id,
                        '$NAME': teName.text,
                        '$CONTENT': teContent.text,
                        '$HOURS': int.parse(teHours.text),
                      });
                      await dbHelper.courseUpdate(upCourse);
                      Navigator.of(context).pop();
                    },
                    child: Text('Update Course',
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
