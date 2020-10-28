import 'package:flutter/material.dart';

import 'screens/hello_screen.dart';
import 'widgets/appbar.dart';
import 'widgets/bottom_sheet_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI elements',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.amber,
        canvasColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Flutter UI elements'),
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: MyAppBar(widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('navigate'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Hello();
                }),
              ),
            ),
            BottomSheetButton(),
          ],
        ),
      ),
    );
  }
}
