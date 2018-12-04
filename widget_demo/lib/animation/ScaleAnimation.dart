import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ScaleAnimationState();
  }
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    animation = new Tween(begin: 100.0, end: 200.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 动画到达终点
          // 执行终点->起点动画
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 动画到达起点
          // 执行起点->终点动画
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedView(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedView extends AnimatedWidget {
  AnimatedView({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Center(
      child: Container(
        color: Colors.blue,
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
