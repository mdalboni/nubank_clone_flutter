import 'package:flutter/material.dart';

Scaffold solidBackgroundScreen(bodyData) {
  return Scaffold(
    appBar: null,
    body: Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(),
      color: Color.fromRGBO(109, 33, 119, 1.0) ,
      child: bodyData,
    ),
  );
}
