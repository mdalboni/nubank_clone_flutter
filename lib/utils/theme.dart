import 'package:flutter/material.dart';

class CommonColors {
  static final Color primary = Color.fromRGBO(129, 38, 157, 1.0);
  static final Color accent = Color.fromRGBO(226, 193, 193, 1.0);
  static final Color positiveBlue = Color.fromRGBO(122, 234, 237, 1.0);
}

ThemeData getThemeData() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: CommonColors.primary,
      accentColor: CommonColors.accent,
      fontFamily: 'Graphik-Regular',
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 28.0, color: CommonColors.primary),
        subhead: TextStyle(fontSize: 28.0, color: CommonColors.accent),
        title: TextStyle(fontSize: 24.0, color: CommonColors.primary),
        subtitle: TextStyle(fontSize: 24.0, color: CommonColors.accent),
        display1: TextStyle(fontSize: 20, color: CommonColors.primary),
        display2: TextStyle(fontSize: 20, color: CommonColors.accent),
        display3: TextStyle(fontSize: 16, color: CommonColors.primary),
        display4: TextStyle(fontSize: 16, color: CommonColors.accent),
        body1: TextStyle(fontSize: 14.0, color: CommonColors.primary),
        body2: TextStyle(fontSize: 14.0, color: CommonColors.accent),
      ),
      primarySwatch: Colors.purple);
}
