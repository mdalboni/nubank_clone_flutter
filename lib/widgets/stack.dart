import 'dart:async';

import 'package:flutter/material.dart';

final topSliderWidgetKey = new GlobalKey<_TopSliderWidgetState>();

class TopSliderWidget extends StatefulWidget {
  TopSliderWidget({Key key, this.body}) : super(key: key);
  final Widget body;

  @override
  _TopSliderWidgetState createState() => _TopSliderWidgetState();
}

class _TopSliderWidgetState extends State<TopSliderWidget> {
  static double _minHeight = 100;
  double _maxHeight;
  Offset _offset = Offset(0, _minHeight);
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    _maxHeight = MediaQuery.of(context).size.height - 55;
    return topSliderPage(
        body: Container(
            height: _maxHeight - _minHeight,
            width: MediaQuery.of(context).size.width,
            child: widget.body));
  }

  Widget topSliderPage({Widget body}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Align(),
        GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _offset = Offset(0, _offset.dy + details.delta.dy);
              if (_offset.dy < _TopSliderWidgetState._minHeight) {
                close();
              } else if (_offset.dy > _maxHeight) {
                open();
              }
            });
          },
          onPanEnd: (details) {
            setState(() {
              double spd = details.velocity.pixelsPerSecond.dy;
              if (spd != 0.0){
                if (spd > 0.0) {
                  open();
                } else {
                  close();
                }

              }else {
                if (_offset.dy > _maxHeight / 2) {
                  open();
                } else {
                  close();
                }
              }
            });
          },
          child: AnimatedContainer(
              duration: Duration.zero,
              curve: Curves.easeOut,
              height: _offset.dy,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: SafeArea(
                  minimum: EdgeInsets.only(top: 50),
                  top: true,
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Column(
                          children: <Widget>[
                            Text('NuBank'),
                            Icon(_isOpen
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down),
                          ],
                        ),
                        onPressed: _handleClick,
                      )
                    ],
                  ))),
        ),
        Positioned(top: _offset.dy, child: body),
      ],
    );
  }

  void close() {
    _offset = Offset(0, _TopSliderWidgetState._minHeight);
    _isOpen = false;
  }

  void open() {
    _offset = Offset(0, _maxHeight);
    _isOpen = true;
  }

  void _handleClick() {
    _isOpen = !_isOpen;
    Timer.periodic(Duration(microseconds: 900), (timer) {
      if (_isOpen) {
        double value = _offset.dy + 1;
        _offset = Offset(0, value);
        if (_offset.dy > _maxHeight) {
          _offset = Offset(0, _maxHeight);
          timer.cancel();
        }
      } else {
        double value = _offset.dy - 1; // we decrement the height by 10 here
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
