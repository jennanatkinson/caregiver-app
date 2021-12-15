import 'package:flutter/material.dart';

// Colors - Color(0xAARRGGBB)
// Primary Color
// https://maketintsandshades.com/#048ABF
const _onPrimaryColorValue = 0xFF048ABF;
const onPrimaryColorMaterial = MaterialColor(
  _onPrimaryColorValue,
  <int, Color>{
    50: Color(0xFFF2FBFC),
    100: Color(0xFFC0EBEF),
    200: Color(0xFF81D6DF),
    300: Color(0xFF04ADC0),
    400: Color(_onPrimaryColorValue),
    500: Color(0xFF02455F)
  },
);

// Secondary Color
const _onSecondaryColorValue = 0xFFF6B541;
const onSecondaryColorMaterial =
    MaterialColor(_onSecondaryColorValue, <int, Color>{
  50: Color(0xFFFEF9F1),
  100: Color(0xFFFDECCF),
  200: Color(0xFFFBDAA0),
  300: Color(_onSecondaryColorValue),
  400: Color(0xFFF69419),
});

// Tertiary Color
const _onTertiaryColorValue = 0xFFF3694D;
const onTertiaryColorMaterial =
    MaterialColor(_onTertiaryColorValue, <int, Color>{
  50: Color(0xFFFDECE9),
  100: Color(0xFFFCD9D3),
  200: Color(0xFFF9B4A6),
  300: Color(_onTertiaryColorValue),
});

// Greys
const _onGreyColorValue = 0xFF888787;
const onGreyColorMaterial = MaterialColor(_onGreyColorValue, <int, Color>{
  50: Color(0xFFEDEDED),
  100: Color(0xFFDBDBDB),
  200: Color(0xFFC3C3C3),
  300: Color(0xFFA09F9F),
  400: Color(_onGreyColorValue),
  500: Color(0xFF5F5E5E)
});

const mainColorScheme = ColorScheme(
  // AppBar, ElevatedButton background, showDatePicker/showTimePicker button text
  primary: onPrimaryColorMaterial,
  primaryVariant: onSecondaryColorMaterial,
  // EventListItemWidget color
  secondary: onSecondaryColorMaterial,
  secondaryVariant: onTertiaryColorMaterial,
  // showTimePicker background
  surface: Colors.white,
  background: onPrimaryColorMaterial,
  error: onTertiaryColorMaterial,
  // AppBar leading and title, TabBar Tab text
  onPrimary: Colors.black,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

var mainThemeData = ThemeData(
    colorScheme: mainColorScheme,
    fontFamily: 'Poppins',
    buttonTheme: ButtonThemeData(
      buttonColor: onPrimaryColorMaterial.shade400,
      textTheme: ButtonTextTheme.primary,
    ));

const standardPadding = EdgeInsets.all(16);
const noPadding = EdgeInsets.all(0);

const double smallTextSize = 12;
const double mediumSmallTextSize = 15;
const double mediumMidSmallTextSize = 18;
const double mediumTextSize = 20;
const double mediumLargeTextSize = 25;

const int _buttonColorBase = 16;
const int _buttonColorAlpha = 0xFF000000;

Color getItemColor(String colorId) {
  return Color(int.parse(colorId, radix: _buttonColorBase) + _buttonColorAlpha);
}

Color getItemOpacityColor(String colorId) {
  return getItemColor(colorId).withOpacity(.2);
}
