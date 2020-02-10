import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/home/page.dart';
import 'package:nubank_clone_flutter/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getThemeData(),
      home: HomePage(),
      routes: {
//          '/stuf': (context) => Stack(),
//        '/login': (context) => SecondScreen(),
//        '/second': (context) => SecondScreen(),
//        '/second': (context) => SecondScreen(),
//        '/second': (context) => SecondScreen(),
//        '/second': (context) => SecondScreen(),
      },
    );
  }
}

