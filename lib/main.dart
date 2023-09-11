import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/store/home_store.dart';
import 'presenter/home.dart';

void main() {
  runApp(
    Provider(
      create: (context) => HomeStore(),
      child: const MyApp(),
    ),
  );
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
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontSize: 21.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: const Home(),
    );
  }
}
