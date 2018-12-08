import 'package:flutter/material.dart';

class PositionAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PositionAnimationState();
  }
}

class PositionAnimationState extends State<PositionAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> positionAnimation;
  Animation<double> scaleAnimation;
  Animation<Color> colorAnimation;
  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    positionAnimation = new Tween(begin: 0.0, end: 200.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    scaleAnimation = new Tween(begin: 100.0, end: 200.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    colorAnimation =
        new ColorTween(begin: Colors.blue, end: Colors.red).animate(controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: colorAnimation.value,
        margin: new EdgeInsets.only(top: positionAnimation.value),
        width: scaleAnimation.value,
        height: scaleAnimation.value,
      ),
    );
  }
}
