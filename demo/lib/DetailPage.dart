import 'package:flutter/material.dart';
import 'package:demo/Planet.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("详情页"),
        ),
        body: new Container(
          constraints: new BoxConstraints.expand(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(planet.name),
              new Image.asset(
                planet.image,
                width: 96.0,
                height: 96.0,
              )
//              new Hero(
//                  tag: "planet-hero-${planet.id}",
//                  child: new Image.asset(
//                    planet.image,
//                    width: 96.0,
//                    height: 96.0,
//                  )
//              )
            ],
          ),
        ));
  }
}
