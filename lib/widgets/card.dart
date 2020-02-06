import 'package:flutter/material.dart';

Widget whiteCard(Widget upperWdg, Widget bottomWdg) {
  return SafeArea(
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox.expand(child: upperWdg),
            flex: 6,
          ),
          Expanded(
            child: SizedBox.expand(child: bottomWdg),
            flex: 2,
          )
        ],
      ),
    ),
    minimum: EdgeInsets.all(25.0),
    bottom: true,
  );
}
