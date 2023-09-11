import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/utils/themes/theme.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Space News',
      theme: myTheme,
      home: const Home(),
    );
  }
}
