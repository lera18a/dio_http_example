import 'package:dio_http_example/ui/splash_screen.dart';
import 'package:dio_http_example/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLightTheme = true;

  void toogleTheme(bool isLight) {
    setState(() {
      _isLightTheme = isLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: _isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: Scaffold(
        body: Center(child: SplashScreen(onThemeChanged: toogleTheme)),
      ),
    );
  }
}
