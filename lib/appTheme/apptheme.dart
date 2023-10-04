import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData appThemeData = ThemeData(
      fontFamily: 'Nunito',
      scaffoldBackgroundColor: Color.fromRGBO(14, 150, 157, 1),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan.shade700,
          shadowColor: Color.fromARGB(155, 0, 0, 0)),
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromARGB(147, 7, 234, 79).withOpacity(0.3),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 2, 170, 247),
            width: 2.0,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white)));

  static CupertinoThemeData iosThemeData = const CupertinoThemeData(
    scaffoldBackgroundColor: Colors.white,
    barBackgroundColor: Color.fromARGB(175, 97, 203, 253),
    primaryColor: Color.fromARGB(146, 217, 243, 255),
    textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(color: Colors.lightBlue, fontFamily: 'Nunito'),
    ),
  );
}
