import 'package:flutter/material.dart';

// Colors - Color(0xAARRGGBB)
// Primary Color
// https://maketintsandshades.com/#048ABF
const _onPrimaryColorValue = 0xFF048ABF;
const _onPrimaryColorMaterial = MaterialColor(
  _onPrimaryColorValue,
  <int, Color>{
    50: Color(0xFFE6F3F9), // Tint 90%
    100: Color(0xFFCDE8F2), // Tint 80%
    200: Color(0xFF9DB0E5), // Tint 60%
    300: Color(0xFF68B9D9), // Tint 40%
    400: Color(0xFF36A1CC), // Tint 20%
    500: Color(_onPrimaryColorValue),
    600: Color(0xFF036E99), // Shade 20%
    700: Color(0xFF025373), // Shade 40%
    800: Color(0xFF02375C), // Shade 60%
    900: Color(0xFF011C26) // Shade 80%
  },
);

// Secondary Color
const _secondaryColorValue = 0xFFF69419;
const _secondaryColorMaterial =
    MaterialColor(_secondaryColorValue, <int, Color>{
  50: Color(0xFFFEF4E8), // Tint 90%
  100: Color(0xFFFDEAD1), // Tint 80%
  200: Color(0xFFFBD4A3), // Tint 60%
  300: Color(0xFFFABF75), // Tint 40%
  400: Color(0xFFF8A947), // Tint 20%
  500: Color(_secondaryColorValue),
  600: Color(0xFFC57614), // Shade 20%
  700: Color(0xFF94590F), // Shade 40%
  800: Color(0xFF623B0A), // Shade 60%
  900: Color(0xFF311E05) // Shade 80%
});

// Tertiary Color

// Accent Color

const mainColorScheme = ColorScheme(
  // AppBar
  primary: Colors.white,
  primaryVariant: Colors.redAccent,
  // EventListItemWidget color
  secondary: _secondaryColorMaterial,
  secondaryVariant: Colors.orangeAccent,
  surface: Colors.yellow,
  background: Colors.yellowAccent,
  error: Colors.green,
  // AppBar leading and title, TabBar Tab text
  onPrimary: _onPrimaryColorMaterial,
  onSecondary: Colors.blue,
  onSurface: Colors.blueAccent,
  onBackground: Colors.indigo,
  onError: Colors.indigoAccent,
  brightness: Brightness.light,
);

var mainThemeData = ThemeData(
  colorScheme: mainColorScheme,
  fontFamily: 'Poppins',
);