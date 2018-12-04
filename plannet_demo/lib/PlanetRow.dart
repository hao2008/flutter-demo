import 'package:flutter/material.dart';
import 'package:plannet_demo/Planet.dart';
import 'package:plannet_demo/DetailPage.dart';
import 'package:plannet_demo/Style.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  // ① 下划线代表私有方法
  // ② 生成图标、数值的部件
  Widget _planetValue({String value, String image}) {
    return new Row(
      children: <Widget>[
        // 图标
        new Image.asset(
          image,
          height: 12.0,
        ),
        // 间距8.0
        new Container(
          width: 8.0,
        ),
        // 数值
        new Text(
          value,
          style: Style.regularTextStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      // 铺满
      constraints: new BoxConstraints.expand(),
      child: new Column(
        // 水平方向，自视图左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 间距4.0
          new Container(
            height: 4.0,
          ),
          // 行星名称
          new Text(
            planet.name,
            style: Style.headerTextStyle,
          ),
          // 间距10.0
          new Container(
            height: 10.0,
          ),
          // 行星位置
          new Text(
            planet.location,
            style: Style.subHeaderTextStyle,
          ),
          // 横岗
          new Container(
            // 上下间距8.0
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),
          // 距离和重力
          new Row(
            // Expanded Widget：Row/Column/Flex子控件铺满主轴方向
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: planet.distance,
                      image: 'assets/img/ic_distance.png')),
              new Expanded(
                  child: _planetValue(
                      value: planet.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          )
        ],
      ),
    );

    final planetThumbnail = new Container(
        // 上下向内偏移16.0
        margin: new EdgeInsets.symmetric(vertical: 16.0),
        // 水平方向靠左边线，垂直方向居中，等价于FractionalOffset(0.0, 0.5);
        alignment: FractionalOffset.centerLeft,
//        child: new Hero(
//          tag: "planet-hero-${planet.id}",
        child: new Image(
          // 使用AssetImage Widget加载图片
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
//          ),
        ));

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
      child: planetCardContent,
    );

    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
            pageBuilder: (_, __, ___) => new DetailPage(planet),
          )),
      child: new Container(
        height: 120.0,
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
      ),
    );
  }
}
