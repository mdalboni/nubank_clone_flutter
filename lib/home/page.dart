import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/widgets/fullscreen.dart';
import 'package:nubank_clone_flutter/widgets/menus.dart';
import 'package:nubank_clone_flutter/widgets/scrollableTab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return solidBackgroundScreen(SafeArea(
        minimum: EdgeInsets.only(bottom: 15),
        bottom: true,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 18,
          ),
          Expanded(child: scrollableTab(controller, context), flex: 53),
          Expanded(child: SizedBox(), flex: 10),
          Expanded(child: horizontalHomeMenu(), flex: 14)
        ])));
  }


}
