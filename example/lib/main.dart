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
              'Note: The current default design draft size of 750 * 1334',
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
                      Text('Direct setting'),
                      Text('width: 375'),
                      Text('height: 100'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenAdapter.value(8)),
            Text('Device width： ${ScreenAdapter.screenWidthPx} px'),
            Text('Device height： ${ScreenAdapter.screenHeightPx} px'),
            Text('Device width： ${ScreenAdapter.screenWidth} dp'),
            Text('Device height： ${ScreenAdapter.screenHeight} dp'),
            Text('Device pixel density： ${ScreenAdapter.pixelRatio}'),
            Text(
                'The ratio of the actual width of the device dp to the design draft px： ${ScreenAdapter.scaleWidth}'),
            Text(
                'The actual height of the equipment dp and the design draft px ratio： ${ScreenAdapter.scaleHeight}'),
            SizedBox(height: ScreenAdapter.value(16)),
            Text('Font scaling： ${ScreenAdapter.textScaleFactor}'),
            Text(
              'I am zoomable text',
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(24),
              ),
            ),
            Text(
              'I will not zoom the text',
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
