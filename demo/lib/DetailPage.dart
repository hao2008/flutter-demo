import 'package:flutter/material.dart';
import 'package:demo/Planet.dart';
import 'package:demo/PlanetSummary.dart';
import 'package:demo/Separator.dart';
import 'package:demo/Style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(
        colors: [new Color(0x00736ab7), new Color(0xff736ab7)],
        stops: [0.0, 0.9],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
      )),
    );
  }

  Widget _getContent() {
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        new PlanetSummary(planet, horizontal: false),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                "简介",
                style: Style.headerTextStyle,
              ),
              new Separator(),
              new Text(planet.description, style: Style.subHeaderTextStyle)
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("详情页"),
        ),
        body: new Container(
          constraints: new BoxConstraints.expand(),
          color: new Color(0xff736ab7),
          child: new Stack(
            children: <Widget>[_getBackground(), _getGradient(), _getContent()],
          ),
        ));
  }
}
