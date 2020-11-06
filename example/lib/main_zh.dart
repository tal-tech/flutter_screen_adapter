import 'package:flutter/material.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Screen Adapter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              '注：当前默认 750 * 1334 的设计稿尺寸',
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: ScreenAdapter.value(8)),
            Row(
              children: [
                Container(
                  width: ScreenAdapter.screenWidth / 2,
                  height: ScreenAdapter.value(200),
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Text('w：${ScreenAdapter.screenWidthPx / 2} px'),
                      Text(
                        'w：${ScreenAdapter.screenWidth / 2} dp',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'h：${ScreenAdapter.value(200)} dp',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenAdapter.screenWidth / 2,
                  height: ScreenAdapter.value(200),
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('w：${ScreenAdapter.screenWidthPx / 2} px'),
                      Text(
                        'w：${ScreenAdapter.screenWidth / 2} dp',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'h：${ScreenAdapter.value(200)} dp',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenAdapter.value(8)),
            Row(
              children: [
                SizedBox(width: ScreenAdapter.value(8)),
                Container(
                  width: ScreenAdapter.value(100),
                  height: ScreenAdapter.value(100),
                  color: Colors.yellow,
                ),
                SizedBox(width: ScreenAdapter.value(8)),
                Column(
                  children: [
                    Text(
                        'ScreenAdapter.width(100)：${ScreenAdapter.value(100)}'),
                    Text(
                        'ScreenAdapter.height(100)：${ScreenAdapter.value(100)}'),
                  ],
                )
              ],
            ),
            SizedBox(height: ScreenAdapter.value(8)),
            Row(
              children: [
                Container(
                  width: 375,
                  height: 100,
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text('直接设置'),
                      Text('width: 375'),
                      Text('height: 100'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenAdapter.value(8)),
            Text('设备宽度： ${ScreenAdapter.screenWidthPx} px'),
            Text('设备高度： ${ScreenAdapter.screenHeightPx} px'),
            Text('设备宽度： ${ScreenAdapter.screenWidth} dp'),
            Text('设备高度： ${ScreenAdapter.screenHeight} dp'),
            Text('设备像素密度： ${ScreenAdapter.pixelRatio}'),
            Text('设备实际宽度 dp 与设计稿 px 比值： ${ScreenAdapter.scaleWidth}'),
            Text('设备实际高度 dp 与设计稿 px 比值： ${ScreenAdapter.scaleHeight}'),
            SizedBox(height: ScreenAdapter.value(16)),
            Text('字体缩放比例： ${ScreenAdapter.textScaleFactor}'),
            Text(
              '我是会缩放的文字',
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(24),
              ),
            ),
            Text(
              '我是不会缩放的文字',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
