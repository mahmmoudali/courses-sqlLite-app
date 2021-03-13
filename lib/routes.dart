import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sql_lite_app/pages/course_details_screen.dart';
import 'package:sql_lite_app/pages/home_screen.dart';
import 'package:sql_lite_app/pages/new_course_screen.dart';
import 'package:sql_lite_app/pages/up.dart';
import 'package:sql_lite_app/pages/update_course_screen.dart';
import 'package:sql_lite_app/pages/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  NewCourse().routeName: (context) => NewCourse(),
  Home().routeName: (context) => Home(),
  CourseDetails().routeName: (context) => CourseDetails(),
  CourseUpdate().routeName: (context) => CourseUpdate(),
  WelcomeScreen().routeName: (context) => WelcomeScreen(),
  Up().routeName: (context) => Up(),
};

final Color kMainColor = HexColor('#7dc488');
final Color kSec1Color = HexColor('#111428');
final Color kSec2Color = HexColor('#1d1f33');
final Color kButColor = Color(0xFFFF5A5F);
final Color kTextColor = HexColor('#22e47a');
final Color kSec3Color = Color(0xFFFF5A5F);
final Color kText2Color = Colors.pink[200];
