# flutter_screen_adapter

[![pub package](https://img.shields.io/pub/v/flutter_screen_adapter.svg)](https://pub.dartlang.org/packages/flutter_screen_adapter)

[中文文档](https://github.com/tal-tech/flutter_screen_adapter/blob/master/README.md)

Flutter application different terminal screen adaptation scheme.

<img src='https://raw.githubusercontent.com/tal-tech/flutter_screen_adapter/master/doc/example.png' alt='example' />

## Steps for usage

### Step 1: Add `flutter_screen_adapter` to the `pubspec.yaml` file

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_screen_adapter: ^0.0.1
```

### Step 2: Initialization

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

    /// Note：
    /// Must be initialized in `WidgetsApp` or `MaterialApp widget`,
    /// Otherwise, an error will be reported because `MediaQuery` cannot be found.

    ScreenAdapter.init(context);
    return ...
  }
}
```

### Step 3: Set the element size

```dart
// Square
Container(
  width: ScreenAdapter.value(100),
  height: ScreenAdapter.value(100),
  color: Colors.yellow,
  child: null
)

// Rectangle

Container(
  width: ScreenAdapter.value(200),
  height: ScreenAdapter.value(100),
  color: Colors.red,
  child: null
)

```

### Provided attributes

<img src="https://raw.githubusercontent.com/tal-tech/flutter_screen_adapter/master/doc/property.png" alt="property"  >

Here are two commonly used

```dart
...

/// Get adaptive value according to device information
/// Used to use different screens to achieve the same effect as the design draft
///
/// [vertical] Whether it is a vertical adaptive value, the default is horizontal

static double value(num value, {vertical = false});

/// Get the current device screen width
///
static double get screenWidth;

...
```