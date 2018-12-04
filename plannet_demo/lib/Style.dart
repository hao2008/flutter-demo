import 'package:flutter/material.dart';

class Style {
  // 基础样式
  static final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
  // 标题样式，基于基础样式
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
  // 内容样式，基于基础样式
  static final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400);
  // 副标题样式，基于内容样式
  static final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
}
