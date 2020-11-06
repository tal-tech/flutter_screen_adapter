# flutter_screen_adapter

[![pub package](https://img.shields.io/pub/v/flutter_screen_adapter.svg)](https://pub.dartlang.org/packages/flutter_screen_adapter)

[README of English](https://github.com/tal-tech/flutter_screen_adapter/blob/master/README_EN.md)

`Flutter` 应用不同终端屏幕适配方案。

<img src='https://raw.githubusercontent.com/tal-tech/flutter_screen_adapter/master/doc/example_zh.png' alt='example' />

## 使用步骤

### 步骤1：添加 `flutter_screen_adapter` 到 `pubspec.yaml` 中

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_screen_adapter: ^0.0.1
```

### 步骤2：初始化

```dart
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    /// 注意：
    /// 一定要在 `WidgetsApp` 或者 `MaterialApp widget` 中初始化
    /// 否则，会因为 `MediaQuery` 找不到报错

    ScreenAdapter.init(context);
    return ...
  }
}
```

### 步骤3：设置元素大小

```dart
// 正方形
Container(
  width: ScreenAdapter.value(100),
  height: ScreenAdapter.value(100),
  color: Colors.yellow,
  child: null
)

// 长方形

Container(
  width: ScreenAdapter.value(200),
  height: ScreenAdapter.value(100),
  color: Colors.red,
  child: null
)

```

## 提供的属性

<img src="https://raw.githubusercontent.com/tal-tech/flutter_screen_adapter/master/doc/property.png" alt="property"  >

### 这里列举两个常用的属性

```dart
...

/// 根据设备信息得到自适应值
/// 用来使用不同屏幕达到跟设计稿一致效果
///
/// [vertical] 是否是垂直自适应数值，默认是水平

static double value(num value, {vertical = false});

/// 获取当前设备屏幕宽度
///
static double get screenWidth;

...
```