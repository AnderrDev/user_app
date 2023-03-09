import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.indigo,
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18)),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Color(0xff5f5f5f)),
        bodyText2: TextStyle(color: Color(0xff5f5f5f))),
    inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xff5f5f5f)),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
  );
}
