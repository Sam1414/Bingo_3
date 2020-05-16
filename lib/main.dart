import 'package:flutter/material.dart';
import 'package:myapp3/grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo_Testing_App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Bingo App')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Grid()),
          ],
        ),
      ),
    );
  }
}
