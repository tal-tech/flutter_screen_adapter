import 'package:flutter/material.dart';

class ScreenAdapter {
  /// 设计稿尺寸
  ///
  /// 默认尺寸 `const Size(750.0, 1334.0)`
  static Size _designSize;

  /// 屏幕宽度
  ///
  static double _screenWidth;

  /// 屏幕高度
  ///
  static double _screenHeight;

  /// 设计稿宽度跟实际屏幕宽度比值
  ///
  static double _scaleWidth;

  /// 设计稿高度跟实际屏幕高度比值
  ///
  static double _scaleHeight;

  /// 设备物理像素
  ///
  static double _pixelRatio;

  /// 设备字体缩放因子
  ///
  static double _textScaleFactor;

  static init(BuildContext context, {Size designSize = const Size(750, 1334)}) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _designSize = designSize;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _scaleWidth = _screenWidth / _designSize.width;
    _scaleHeight = _screenHeight / _designSize.height;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  /// 获取当前设备像素比
  ///
  static double get pixelRatio => _pixelRatio;

  /// 获取当前设备宽度与设计宽度比值
  ///
  static double get scaleWidth => _scaleWidth;

  /// 获取当前设备高度与设计高度比值
  ///
  static double get scaleHeight => _scaleHeight;

  /// 文字缩放比例
  ///
  static double get scaleText => _scaleWidth;

  /// 根据设备信息得到自适应值
  /// 用来使用不同屏幕达到跟设计稿一致效果
  ///
  /// [vertical] 是否是垂直自适应数值，默认是水平
  static double value(num value, {vertical = false}) =>
      vertical ? _scaleHeight * value : _scaleWidth * value;

  /// 文字适配
  ///
  static double fontSize(num fontSize) => fontSize * scaleText;

  /// 获取当前设备屏幕宽度
  ///
  static double get screenWidth => _screenWidth;

  /// 获取当前设备屏幕高度
  ///
  static double get screenHeight => _screenHeight;

  /// 获取当前设备文字缩放因子
  ///
  static double get textScaleFactor => _textScaleFactor;

  /// 获取当前设备屏幕宽度 px
  ///
  static double get screenWidthPx => _screenWidth * pixelRatio;

  /// 获取当前设备屏幕高度 px
  ///
  static double get screenHeightPx => _screenHeight * pixelRatio;
}
