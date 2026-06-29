import 'package:flutter/material.dart';
import 'package:untitled1/player_screen.dart';
import 'package:untitled1/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),

      home: const PlayerScreen(),

    );
  }
}
