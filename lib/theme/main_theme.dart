import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: CustomColors.getColor(CustomColors.orange, 0),
        colorScheme: ColorScheme(
          // AppBar
          primary: CustomColors.getColor(CustomColors.orange, 0),
          primaryVariant: CustomColors.getColor(CustomColors.orange, 100),
          // EventListItemWidget color
          secondary: CustomColors.getColor(CustomColors.teal, 400),
          secondaryVariant: CustomColors.getColor(CustomColors.teal, 200),
          surface: CustomColors.getColor(CustomColors.orange, 100),
          background: Colors.white,
          error: CustomColors.getColor(CustomColors.red, 300),
          // AppBar leading and title, TabBar Tab text
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins', //3
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          buttonColor: CustomColors.getColor(CustomColors.teal, 400),
        )
    );
  }
}