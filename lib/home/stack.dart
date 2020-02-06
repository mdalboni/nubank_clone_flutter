import 'dart:async';

import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  StackPage({Key key, this.title}) : super(key: key);

  final String title;
  final String route = '/stack';

  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  static double _minHeight = 80, _maxHeight = 600;
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: null,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Align(child: FlutterLogo(size: 300)),
          GestureDetector(
            onPanUpdate: (details) {
              _offset = Offset(0, _offset.dy + details.delta.dy);
              if (_offset.dy < _StackPageState._minHeight) {
                _offset = Offset(0, _StackPageState._minHeight);
                _isOpen = false;
              } else if (_offset.dy > _StackPageState._maxHeight) {
                _offset = Offset(0, _StackPageState._maxHeight);
                _isOpen = true;
              }
              setState(() {});
            },
            onPanDown: (details){
              print('--DOWN--');
              print(details);
              print(_offset.dy);
              setState(() {});
            },
            onPanEnd: (details){
              print('--END--');
              print(details);
              print(_offset.dy);
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 10)]),
              child: Container(child: Text(_isOpen ? "Back" : "")),
            ),
          ),
        ],
      ),
    );
  }

  // first it opens the sheet and when called again it closes.
  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      if (_isOpen) {
        double value = _offset.dy + 10; // we increment the height of the Container by 10 every 5ms
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset = Offset(0, _maxHeight); // makes sure it does't go above maxHeight
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 10; // we decrement the height by 10 here
        _offset = Offset(0, value);
        if (_offset.dy < _minHeight) {
          _offset = Offset(0, _minHeight); // makes sure it doesn't go beyond minHeight
          timer.cancel();
        }
      }
      setState(() {});
    });
  }
}