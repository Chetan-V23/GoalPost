import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primaryColor: Color(0xFF121212),
  scaffoldBackgroundColor: Color(0xFF121212),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Color(0xFF121212),
    ),
    bodyText1: TextStyle(
      color: Color(0xFF121212),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      backgroundColor:  Color(0xFF404040),

    ),
  ),
);

//Color textColor = Color(0xFF121212);

//ButtonStyle=ElevatedButton.styleFrom()
