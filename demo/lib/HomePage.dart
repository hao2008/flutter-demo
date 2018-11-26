import 'package:flutter/material.dart';
import 'package:demo/GradientAppBar.dart';
import 'package:demo/HomePageBody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("行星"),
          new HomePageBody(),
        ],
      ),
    );
  }
}
