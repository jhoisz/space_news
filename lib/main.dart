import 'package:flutter/material.dart';

import 'presenter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
      home: const Home(),
    );
  }
}
