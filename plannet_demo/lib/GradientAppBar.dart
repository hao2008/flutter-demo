import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    // 获取状态栏高度
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    // 需要使用Container Widget添加样式
    return new Container(
      // 上面偏移一个状态栏的高度
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      // 需要使用BoxDecoration Widget添加渐变样式
      decoration: new BoxDecoration(
          // LinearGradient Widget渐变样式部件
          // colors: 颜色数组
          // begin: 起始坐标（x, y)，
          // end: 结尾坐标(x, y)，如果begin和end的x相等（0.0， 0.0）（0.0， 1.0）代表y方向（垂直）渐变色，y相等0.0，0.0）（1.0, 0.0）代表x方向（水平）渐变色
          // stops: colors如何分布，[0.0, 1.0]代表从左到右铺满，[0.0, 0.5]代表从左到右铺满一半
          // tileMode: 平铺模式，三个枚举值 clamp - 铺满、repeated - 重复铺满、mirror - 镜像铺满
          gradient: new LinearGradient(
              colors: [
                const Color(0xff3366ff),
                const Color(0xff00ccff),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(
              color: Colors.white,
              // 使用我们添加的字体
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 36.0),
        ),
      ),
    );
  }
}
