import 'package:flutter/material.dart';
import 'ScaleAnimation.dart';
import 'BarLoadingScreen.dart';
import 'ColorAnimation.dart';

class AnimationWidget extends StatelessWidget {
  AnimationWidget();

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      margin: EdgeInsets.all(10.0),
      constraints: BoxConstraints.expand(),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            "缩放动画",
            style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          new Container(
            height: 250.0,
            child: new ScaleAnimation(),
          ),
          new Text(
            "颜色动画",
            style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          new Container(
            height: 250.0,
            child: new ColorAnimation(),
          )
        ],
      ),
    );
  }
}
