import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sql_lite_app/DB/db_helper.dart';
import 'package:sql_lite_app/components/TextFieldForm.dart';
import 'package:sql_lite_app/model/course.dart';
import 'package:sql_lite_app/pages/course_details_screen.dart';
import 'package:sql_lite_app/pages/new_course_screen.dart';
import 'package:sql_lite_app/pages/up.dart';

import 'package:sql_lite_app/routes.dart';

class Home extends StatefulWidget {
  String routeName = '/home';
  String name, content;
  int hours;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper;

  TextEditingController teSearch = new TextEditingController();
  var allCourses = [];
  var items = [];

  @override
  void initState() {
    // dbHelper
    dbHelper = DbHelper();
    dbHelper.loadAllCourses().then((value) {
      allCourses = value;
      items = allCourses;
    });
    super.initState();
  }

  void filterSearch(String query) async {
    var dummySearchList = allCourses;
    if (query.isNotEmpty) {
      var dummySearchData = [];
      dummySearchList.forEach((item) {
        var course = Course.fromMap(item);
        if (course.name.toLowerCase().contains(query.toLowerCase())) {
          dummySearchData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummySearchData);
      });
    } else {
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  void reloadData() {
    dbHelper = DbHelper();
    dbHelper.loadAllCourses().then((value) {
      allCourses = value;
      items = allCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: kMainColor,
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, NewCourse().routeName);
                });
              }),
          IconButton(
              icon: Icon(Icons.replay_outlined),
              onPressed: () {
                setState(() {
                  reloadData();
                });
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BuildTextFromFeild(
                hint: 'Search',
                icon: Icons.search,
                onChanged: (value) {
                  setState(() {
                    filterSearch(value);
                  });
                }),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Course course = Course.fromMap(items[index]);

                  return Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 35,
                        child: Icon(
                          Icons.delete,
                          color: kButColor,
                          size: 50,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 35,
                        child: Icon(
                          Icons.delete,
                          color: kButColor,
                          size: 50,
                        ),
                      ),
                      Dismissible(
                        key: Key('${course.id}'),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadowColor: kButColor,
                          elevation: 1,
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            leading: Container(
                              child: Image.asset('assets/images/air2.png'),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            title: Row(
                              children: [
                                Text(
                                  '${course.name}',
                                  style: TextStyle(
                                      fontFamily: GoogleFonts.exo2().fontFamily,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(
                                  FontAwesomeIcons.hourglass,
                                  size: 15,
                                  color: kButColor,
                                ),
                                Text(
                                  ' ${course.hours} hours',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.exo2().fontFamily),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              '${course.content}',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.exo2().fontFamily),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Wrap(
                              spacing: -10,
                              runSpacing: 2,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: kButColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, Up().routeName,
                                        arguments: course);
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CourseDetails().routeName,
                                  arguments: course);
                            },
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() async {
                            await dbHelper.delete(course.id);
                            reloadData();
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
