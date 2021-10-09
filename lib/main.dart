import 'package:flutter/material.dart';
import 'package:gmap/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PeterParker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Search(),
    );
  }
}
