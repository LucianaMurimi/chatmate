import 'package:flutter/material.dart';

// C0LOURS
//------------------------------------------------------------------------------
const Color chatmatePrimary = Color(0xFF00c853);
const Color chatmatePrimaryVariant = Color(0xFF009624);

const Color chatmateSecondary = Color(0xFF009624);
const Color chatmateSecondaryVariant = Color(0xFF006700);

const Color chatmateErrorRed = Color(0xFFc85300);
const Color chatmateBlack = Color(0xFF000000);
const Color chatmateWhite = Color(0xFFffffff);


// THEME DATA
//------------------------------------------------------------------------------
ThemeData chatmateTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: _chatmateColorScheme,
    primaryColor: chatmatePrimary,
    errorColor: chatmateErrorRed,

    scaffoldBackgroundColor: Colors.white,

    textTheme: _chatmateTextTheme(base.textTheme),
    primaryTextTheme: _chatmateTextTheme(base.primaryTextTheme),
    accentTextTheme: _chatmateTextTheme(base.accentTextTheme),

    textSelectionColor: chatmateSecondary,

    // iconTheme: chatmateIconTheme(base.iconTheme),
  );
}

// ICON THEME
//------------------------------------------------------------------------------
IconThemeData chatmateIconTheme(IconThemeData original) {
  return original.copyWith(
      color: chatmatePrimaryVariant,
  );
}

// TEXT THEME
//------------------------------------------------------------------------------
TextTheme _chatmateTextTheme(TextTheme base) {
  return base
      .apply(
    fontFamily: 'WorkSansMedium',
  );
}


// COLOR SCHEME
//------------------------------------------------------------------------------
const ColorScheme _chatmateColorScheme = ColorScheme(
  primary: chatmatePrimary,
  primaryVariant: chatmatePrimaryVariant,
  onPrimary: chatmateBlack,

  secondary: chatmateSecondary,
  secondaryVariant: chatmateSecondaryVariant,
  onSecondary: chatmateBlack,

  surface: chatmateWhite,
  onSurface: chatmateBlack,

  background: chatmateWhite,
  onBackground: chatmateBlack,

  error: chatmateErrorRed,
  onError: chatmateWhite,

  brightness: Brightness.dark,
);


