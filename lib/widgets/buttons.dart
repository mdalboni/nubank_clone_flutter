import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/colors.dart';

Widget greyContainerButton(IconData icon, String label) {
  return Container(
      width: 100,
      height: double.infinity,
      decoration: BoxDecoration(
        color: greyOpacity20(),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: FlatButton(
        onPressed: () {},
        child: SafeArea(
            minimum: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 34.0,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Text(
                  label,
                  textAlign: TextAlign.left,
                )
              ],
            )),
      ));
}

Widget transparentButton(IconData icon, String label) {
  return Container(
      color: Colors.transparent,
      child: FlatButton(
        onPressed: () {},
        child: SafeArea(
            minimum: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 34.0,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Text(
                  label,
                  textAlign: TextAlign.left,
                )
              ],
            )),
      ));
}
