import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/widgets/fullscreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return solidBackgroundScreen(form(context));
  }

  Widget form(context) {
    return SafeArea(
        child: Column(
      children: [
        Text('ARIBA'),
        Text('ARIBA'),
        Text('ARIBA'),
        Text('ARIBA'),
        Text('ARIBA'),
        Text('ARIBA')
      ],
    ));
  }
}
