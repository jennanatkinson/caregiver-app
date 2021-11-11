import 'package:flutter/material.dart';

// Colors - Color(0xAARRGGBB)
// Primary Color
// https://maketintsandshades.com/#048ABF
const onPrimaryColorValue = 0xFF048ABF;
const onPrimaryMaterial = MaterialColor(
  onPrimaryColorValue,
  <int, Color>{
    50: Color(0xFFE6F3F9),  // Tint 90%
    100: Color(0xFFCDE8F2), // Tint 80%
    200: Color(0xFF9DB0E5), // Tint 60%
    300: Color(0xFF68B9D9), // Tint 40%
    400: Color(0xFF36A1CC), // Tint 20%
    500: Color(onPrimaryColorValue),
    600: Color(0xFF036E99), // Shade 20%
    700: Color(0xFF025373), // Shade 40%
    800: Color(0xFF02375C), // Shade 60%
    900: Color(0xFF011C26), // Shade 80%
  },
);

// Secondary Color

// Tertiary Color

// Accent Color

const mainColorScheme = ColorScheme(
  // AppBar
  primary: Colors.white,
  primaryVariant: Colors.redAccent,
  secondary: Colors.orange,
  secondaryVariant: Colors.orangeAccent,
  surface: Colors.yellow,
  background: Colors.yellowAccent,
  error: Colors.green,
  // AppBar leading and title
  onPrimary: onPrimaryMaterial,
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