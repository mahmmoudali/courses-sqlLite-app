import 'package:flutter/material.dart';

import 'package:sql_lite_app/pages/welcome_screen.dart';
import 'package:sql_lite_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sql_lite ',
      theme: ThemeData.light().copyWith(
        // scaffoldBackgroundColor: Color(0xFF1b1b1b),
        primaryColor: Color(0xFFFF5A5F),
        appBarTheme: AppBarTheme(centerTitle: true),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      initialRoute: WelcomeScreen().routeName,
    );
  }
}
