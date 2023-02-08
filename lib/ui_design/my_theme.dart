import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimary = Color(0xFF5D9CEC);
    static const Color colorGray = Color(0xFFC8C9CB);
  static const Color Green = Color(0xFF6BE32E);
  static const Color darkScaffoldBackgroundColor =Color(0xFF060E1E);
  static const Color scondaryDark = Color(0xFF141922);
  static const Color lightScaffoldBackgroundColor = Color(0xFFB5CBB4);
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimary,
    ),
    scaffoldBackgroundColor: lightScaffoldBackgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
        elevation: 0,
      selectedIconTheme: IconThemeData(
        size: 36,
        color: lightPrimary,
      ),
      unselectedIconTheme: IconThemeData(
      size: 28,
      color: colorGray,
    )
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          topLeft: Radius.circular(18),
        )
      )
    ),
    textTheme:  TextTheme(
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),

  ),
primaryColor:lightPrimary
  );
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: lightPrimary,
      ),
      scaffoldBackgroundColor:darkScaffoldBackgroundColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(
            size: 36,
            color: lightPrimary,
          ),
          unselectedIconTheme: IconThemeData(
            size: 28,
            color: colorGray,
          )
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF141922),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                topLeft: Radius.circular(18),
              )
          )
      ),
      textTheme:  TextTheme(
        headline5: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),

      ),
      primaryColor:lightPrimary
  );

}