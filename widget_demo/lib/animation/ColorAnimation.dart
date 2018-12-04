import 'package:flutter/material.dart';

class ColorAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    ColorAnimation();
    // TODO: implement createState
    return new _ColorAnimationState();
  }
}

class _ColorAnimationState extends State<ColorAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    _animation =
        new ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        color: _animation.value,
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}
