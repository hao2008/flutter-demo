import 'package:flutter/material.dart';
import 'package:widget_demo/widget/BasicWidget.dart';
import 'package:widget_demo/webview/MyWebView.dart';
import 'package:widget_demo/animation/AnimationWidget.dart';

void main() => runApp(MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Home(),
    ));

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("部件示例Demo"),
        ),
        body: new Container(
          color: Colors.white,
          constraints: BoxConstraints.expand(),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _createButton(context, "基础控件", new BasicWidget()),
              _createButton(context, "WebView控件", new MyWebView()),
              _createButton(context, "动画控件", new AnimationWidget())
            ],
          ),
        ));
  }

  Widget _createButton(BuildContext context, String title, Widget view) {
    return new GestureDetector(
        child: new Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 250.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(5.0),
              boxShadow: [
                new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 5.0))
              ]),
          child: new Text(
            title + " >",
            style: new TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          // 使用Navigator时，根部件是Scaffold，不能是MaterialApp，否则抛出异常
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new Scaffold(
                      appBar: new AppBar(
                        title: new Text(title),
                      ),
                      body: view)));
        });
  }
}
