import 'package:chat/loading.dart';
import 'package:chat/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:chat/app.dart';

void main() {
  runApp(MyApp());
}

final ThemeData defaultTheme = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '聊天室',
      theme: defaultTheme,
      home: LoadingPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "/firends": (_) => WebviewScaffold(
              url: 'https://flutter.io',
              appBar: AppBar(title: Text('Flutter 官网')),
              withZoom: true,
              withLocalStorage: true,
            ),
        'search': (BuildContext context) => Search()
      },
    );
  }
}
