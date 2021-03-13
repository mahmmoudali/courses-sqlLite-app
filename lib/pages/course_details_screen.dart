import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sql_lite_app/model/course.dart';
import 'package:sql_lite_app/routes.dart';

class CourseDetails extends StatelessWidget {
  String routeName = '/course_details';
  Course course;

  @override
  Widget build(BuildContext context) {
    course = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                course.name.toUpperCase(),
                style: TextStyle(
                    fontFamily: GoogleFonts.exo2().fontFamily,
                    fontSize: 30,
                    color: kButColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Divider(),
              Text(
                course.content,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Divider(),
              Text(
                '${course.hours}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
