import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/widgets/fullscreen.dart';
import 'package:nubank_clone_flutter/widgets/menus.dart';
import 'package:nubank_clone_flutter/widgets/scrollableTab.dart';
import 'package:nubank_clone_flutter/widgets/stack.dart';

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
    return solidBackgroundScreen(TopSliderWidget(
        key: topSliderWidgetKey,
        body: Column(children: <Widget>[
          Expanded(child: scrollableTab(controller, context), flex: 75),
          Expanded(child: SizedBox(), flex: 10),
          horizontalHomeMenu()
        ])));
  }
}
