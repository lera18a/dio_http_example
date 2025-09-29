import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// prymaryColor - главный акцент(кнопки, иконки, важные элементы)
// backgroundColor — фон экранов
// textColor — цвет основного текста
// secondaryColor — дополнительный акцент (необязательно)
// errorColor — для ошибок

// Совет: в ThemeData лучше использовать:

// scaffoldBackgroundColor — для фона всего экрана
// appBarTheme.backgroundColor — для фона AppBar’а
// Они должны гармонировать между собой.
///------------------------

final primaryColorLight = Colors.green[700];
final backgroundColorLight = Colors.green[50];
const textColorLight = Colors.black87;
final scaffoldBackgroundColorLight = Colors.grey[50];
const errorColorLight = Colors.redAccent;
final hintColorLight = Colors.grey[600];

final primaryColorDark = Colors.green[400];
const backgroundColorDark = Color(0xFF1E1E1E);
final textColorDark = Colors.white;
final scaffoldBackgroundColorDark = Color(0xFF121212);
const errorColorDark = Colors.redAccent;
const hintColorDark = Colors.white70;

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColorLight,
  scaffoldBackgroundColor: scaffoldBackgroundColorLight,
  hintColor: hintColorLight,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColorLight,
    titleTextStyle: TextStyle(
      color: textColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: textColorDark),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: primaryColorLight,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: textColorLight,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля hint
    labelMedium: TextStyle(
      color: textColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля !ошибки!
    bodySmall: TextStyle(
      color: errorColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: textColorLight,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: textColorLight,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColorLight,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //спроси зачем?
      //  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //и зачем вообще colorSheme
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: primaryColorLight!,
    onPrimary: textColorLight,
    secondary: Colors.blueGrey[600]!,
    onSecondary: Colors.white,
    error: errorColorLight,
    surface: Colors.white,
    onSurface: textColorLight,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColorDark,
  scaffoldBackgroundColor: scaffoldBackgroundColorDark,
  hintColor: hintColorDark,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColorDark,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: primaryColorDark,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: textColorDark,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля hint
    labelMedium: TextStyle(
      color: textColorDark,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ), //настройка стиля !ошибки!
    bodySmall: TextStyle(
      color: errorColorDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: textColorDark,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: textColorDark,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColorDark,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: primaryColorDark!,
    onPrimary: Colors.black87,
    secondary: Colors.blueGrey[300]!,
    onSecondary: Colors.black,
    error: errorColorDark,
    surface: Color(0xFF1E1E1E),
    onSurface: textColorDark,
  ),
);
