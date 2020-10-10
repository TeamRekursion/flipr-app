import 'package:flutter/material.dart';

const blue = Color(0xFF5A80FF);
const darkGrey = Color(0xFF242424);
const lightGrey = Color(0xFF303030);
const disabledColor = Color(0xFF585858);
const backgroundColor = Color(0xFF131313);

final cardRadius10 = BorderRadius.circular(10);

final pageTransition = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

final ThemeData darkTheme = ThemeData(
  fontFamily: 'Rubik',
  accentColor: blue,
  primaryColor: blue,
  primaryColorDark: blue,
  scaffoldBackgroundColor: Colors.black,
  cardColor: darkGrey,
  applyElevationOverlayColor: true,
  brightness: Brightness.dark,
  pageTransitionsTheme: pageTransition,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      gapPadding: 16,
      borderSide: BorderSide.none,
    ),
  ),
);
