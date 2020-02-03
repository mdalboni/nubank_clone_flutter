import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/theme.dart';

Scaffold solidBackgroundScreen(bodyData) {
  return Scaffold(
    appBar: null,
    body: Container(
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(),
      color: CommonColors.primary ,
      child: bodyData,
    ),
  );
}
