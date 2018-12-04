import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebView extends StatelessWidget {
  MyWebView();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WebviewScaffold(
        url: "https://www.toutiao.com/i6627782259095126542/");
  }
}
