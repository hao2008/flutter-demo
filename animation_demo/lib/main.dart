import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AnimationControllerOutPutBody(),
    );
  }
}

class AnimationControllerOutPutBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AnimationControllerOutPutBodyState();
  }
}

class AnimationControllerOutPutBodyState
    extends State<AnimationControllerOutPutBody>
    with SingleTickerProviderStateMixin {
  AnimationController animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animation.addListener(() {
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new Container(
      color: Colors.white,
      child: new GestureDetector(
        child: new Center(
          child: new Text(
            animation.isAnimating ? animation.value.toStringAsFixed(3) : "开始动画",
            style: new TextStyle(
                fontSize: 50.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          animation.forward(from: 0.0);
        },
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }
}
