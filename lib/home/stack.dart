import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/widgets/menus.dart';
import 'package:nubank_clone_flutter/widgets/scrollableTab.dart';

class StackPage extends StatefulWidget {
  StackPage({Key key, this.title}) : super(key: key);

  final String title;
  final String route = '/stack';

  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  static double _minHeight = 150;
  double _maxHeight;
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    _maxHeight = MediaQuery.of(context).size.height - 30;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: null,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(),
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
              _offset = Offset(0, _offset.dy + details.delta.dy);
              if (_offset.dy < _StackPageState._minHeight) {
                _offset = Offset(0, _StackPageState._minHeight);
                _isOpen = false;
              } else if (_offset.dy > _maxHeight) {
                _offset = Offset(0, _maxHeight);
                _isOpen = true;
              }
              });
            },
            onPanEnd: (details) {
              setState(() {
              if (_offset.dy > _maxHeight / 2) {
                _offset = Offset(0, _maxHeight);
                _isOpen = true;
              } else {
                _offset = Offset(0, _StackPageState._minHeight);
                _isOpen = false;
              }
              });
            },
            child: AnimatedContainer(
                duration: Duration.zero,
                curve: Curves.easeOut,
                height: _offset.dy,
                alignment: Alignment.center,
//                decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                  BoxShadow(
//                      color: Colors.grey.withOpacity(0.5),
//                      spreadRadius: 5,
//                      blurRadius: 10)
//                ]),
                child: Column(
                  children: <Widget>[
                    Container(child: Text(_isOpen ? "Back" : "")),
                    FlatButton(
                      child:
                          Icon(_isOpen ? Icons.keyboard_arrow_down : Icons.add),
                      onPressed: _handleClick,
                    )
                  ],
                )),
          ),
          Positioned(
              top: _offset.dy,
              child: Container(
                  height: _maxHeight - _minHeight,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: <Widget>[
                    Expanded(
                        child: scrollableTab(controller, context), flex: 53),
                    Expanded(child: SizedBox(), flex: 10),
                    Expanded(child: horizontalHomeMenu(), flex: 14)
                  ]))),
        ],
      ),
    );
  }

  // first it opens the sheet and when called again it closes.
  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_isOpen) {
        double value = _offset.dy + 10;
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset = Offset(0, _maxHeight);
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 10; // we decrement the height by 10 here
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = Offset(
              0, _minHeight); // makes sure it doesn't go beyond minHeight
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}
