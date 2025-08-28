import 'package:bnsp/splash.dart';
import 'package:bnsp/input_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KampusKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash(),
      routes: {
        '/input_data': (context) => InputData(),
      },
    );
  }
}