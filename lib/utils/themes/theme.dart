import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorSchemeSeed: Colors.lightBlue,
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

abstract class ArticleDecoration {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dateStyle = const TextStyle(
    fontSize: 12.0,
  );
}

abstract class ArticleDetailDecoration {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dateStyle = const TextStyle(
    fontSize: 14.0,
  );
  static TextStyle textStyle = const TextStyle(
    fontSize: 14.0,
    color: Colors.white60,
  );
}
