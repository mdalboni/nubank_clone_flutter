import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(109, 33, 119, 1.0),
      accentColor: Color.fromRGBO(109, 33, 119, 1.0),
      fontFamily: 'Graphik-Regular',
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(
          fontSize: 14.0,
        ),
      ),
      primarySwatch: Colors.purple);
}
