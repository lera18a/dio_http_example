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

class AppSizes {
  static const double fontSizeHeadline = 30;
  static const double fontSizeBodyLarge = 24;
  static const double fontSizeBodyMedium = 20;
  static const double fontSizeBodySmall = 14;
  static const double fontSizeLabel = 14;
  static const double fontSizeTitle = 16;
  static const double borderRadius = 20;
  static const double buttonPaddingHorizontal = 24;
  static const double buttonPaddingVertical = 12;
}

//пример использования Enviroment в дебаг моде или в продакшн
// final primaryColorLight = EnviromentVariables.isDebug
//     ? Colors.green[700]
//     : Colors.amber;

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

final _baseTextTheme = GoogleFonts.robotoTextTheme();

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColorLight,
  scaffoldBackgroundColor: scaffoldBackgroundColorLight,
  hintColor: hintColorLight,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColorLight,
    titleTextStyle: TextStyle(
      color: textColorLight,
      fontSize: AppSizes.fontSizeBodyMedium,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: textColorLight),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: primaryColorLight,
      fontSize: AppSizes.fontSizeBodyLarge,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: textColorLight,
      fontSize: AppSizes.fontSizeBodyMedium,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля hint
    labelMedium: TextStyle(
      color: textColorLight,
      fontSize: AppSizes.fontSizeBodySmall,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля !ошибки!
    bodySmall: TextStyle(
      color: errorColorLight,
      fontSize: AppSizes.fontSizeBodySmall,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      fontSize: AppSizes.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: textColorLight,
    ),
    titleSmall: TextStyle(
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: textColorLight,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColorLight,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.buttonPaddingHorizontal,
        vertical: AppSizes.buttonPaddingVertical,
      ),
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
    primaryContainer: Colors.green[100],
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColorDark,
  scaffoldBackgroundColor: scaffoldBackgroundColorDark,
  hintColor: hintColorDark,
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColorDark,
    foregroundColor: textColorDark,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: AppSizes.fontSizeBodyMedium,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: _baseTextTheme.copyWith(
    bodyLarge: TextStyle(
      color: primaryColorDark,
      fontSize: AppSizes.fontSizeBodyLarge,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: textColorDark,
      fontSize: AppSizes.fontSizeBodyMedium,
      fontWeight: FontWeight.normal,
    ),
    //настройка стиля hint
    labelMedium: TextStyle(
      color: textColorDark,
      fontSize: AppSizes.fontSizeLabel,
      fontWeight: FontWeight.normal,
    ), //настройка стиля !ошибки!
    bodySmall: TextStyle(
      color: errorColorDark,
      fontSize: AppSizes.fontSizeBodySmall,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: TextStyle(
      fontSize: AppSizes.fontSizeHeadline,
      fontWeight: FontWeight.bold,
      color: textColorDark,
    ),
    titleSmall: TextStyle(
      fontSize: AppSizes.fontSizeTitle,
      fontWeight: FontWeight.w600,
      color: textColorDark,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColorDark,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      padding: EdgeInsets.symmetric(
        // ← Добавляем padding
        horizontal: AppSizes.buttonPaddingHorizontal,
        vertical: AppSizes.buttonPaddingVertical,
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
    primaryContainer: Colors.green[900],
  ),
);
