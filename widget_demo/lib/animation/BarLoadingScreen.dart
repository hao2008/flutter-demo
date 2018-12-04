import 'package:flutter/material.dart';

class BarLoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    BarLoadingScreen();
    // TODO: implement createState
    return new _BarLoadingScreenState();
  }
}

class _BarLoadingScreenState extends State<BarLoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    animation = new ColorTween(
      begin: Colors.blue,
      end: Colors.green,
    ).animate(_controller)
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
    return new Container(
      decoration: new BoxDecoration(color: animation.value),
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Bar(), new Bar(), new Bar(), new Bar()],
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: 35.0,
      height: 15.0,
      decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: [
            new BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: new Offset(1.0, 0.0)),
            new BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                spreadRadius: 1.5,
                offset: new Offset(1.0, 0.0))
          ]),
    );
  }
}
