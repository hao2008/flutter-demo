import 'package:flutter/material.dart';
import 'package:demo/PlanetRow.dart';
import 'package:demo/Planet.dart';

class HomePageBody extends StatelessWidget {
  final List<Planet> planets = [
    const Planet(
      id: 1,
      name: "火星",
      location: "银河系",
      distance: "220.0m km",
      gravity: "3.7 m/s",
      description: "遥远的星球",
      image: "assets/img/mars.png",
    ),
    const Planet(
      id: 1,
      name: "海王星",
      location: "银河系",
      distance: "54.6m km",
      gravity: "11.15 m/s",
      description: "遥远的星球",
      image: "assets/img/neptune.png",
    ),
    const Planet(
      id: 1,
      name: "月球",
      location: "银河系",
      distance: "54.6m km",
      gravity: "1.622 m/s",
      description: "遥远的星球",
      image: "assets/img/moon.png",
    ),
    const Planet(
      id: 1,
      name: "地球",
      location: "银河系",
      distance: "0m km",
      gravity: "9.8 m/s",
      description: "我们的星球",
      image: "assets/img/earth.png",
    ),
    const Planet(
      id: 1,
      name: "水星",
      location: "银河系",
      distance: "54.6m km",
      gravity: "3.7 m/s",
      description: "遥远的星球",
      image: "assets/img/mercury.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Container(
      color: new Color(0xff736ab7),
      child: new CustomScrollView(
        scrollDirection: Axis.vertical, // 竖直方向滚动
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0), // 上下向内偏移24.0px
            sliver: new SliverFixedExtentList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new PlanetRow(planets[index]),
                  childCount: planets.length,
                ),
                itemExtent: 152.0),
          )
        ],
      ),
    ));
  }
}
