import 'package:flutter/material.dart';

class PlanetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      // 上下向内偏移16.0
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      // 水平方向靠左边线，垂直方向居中，等价于FractionalOffset(0.0, 0.5);
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        // 使用AssetImage Widget加载图片
        image: new AssetImage("assets/img/mars.png"),
        height: 92.0,
        width: 92.0,
      ),
    );

    final planetCard = new Container(
      height: 124.0,
      // 左侧偏移46.0
      margin: new EdgeInsets.only(left: 46.0),
      // 设置样式
      decoration: new BoxDecoration(
          color: new Color(0xff333366),
          // 设置为矩形
          shape: BoxShape.rectangle,
          // 设置圆角为8.0
          borderRadius: new BorderRadius.circular(8.0),
          // 设置阴影，向下偏移10.0，模糊半径10.0
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              // 模糊半径10.0
              blurRadius: 10.0,
              // 向下偏移10.0
              offset: new Offset(0.0, 10.0),
            )
          ]),
    );

    return new Container(
      // EdgeInsets.symmetric等同于EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0, right: 24.0)
      margin: const EdgeInsets.symmetric(
        // 上下偏移16.0
        vertical: 16.0,
        // 左右偏移24.0
        horizontal: 24.0,
      ),
      // Stack Widget用于创建上下重叠部件
      child: new Stack(
        children: <Widget>[planetCard, planetThumbnail],
      ),
    );
  }
}
