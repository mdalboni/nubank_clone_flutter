import 'package:flutter/material.dart';

List<int> calculateMoneyBar(
    double spent, double spentNow, double toBePaid, double free) {
  int total = ((spent + spentNow + toBePaid + free) * 100).toInt();
  int val1 = (spent * 100) ~/ total;
  int val2 = (spentNow * 100) ~/ total;
  int val3 = (toBePaid * 100) ~/ total;
  int val4 = (free * 100) ~/ total;
  return [val1, val2, val3, val4];
}

Widget moneyBar(int spent, int spentNow, int toBePaid, int free) {
  return Column(
    children: <Widget>[
      Expanded(child: Container(color: Colors.orange), flex: spent),
      Expanded(child: Container(color: Colors.lightBlue), flex: spentNow),
      Expanded(child: Container(color: Colors.redAccent), flex: toBePaid),
      Expanded(child: Container(color: Colors.lightGreenAccent), flex: free),
    ],
  );
}
