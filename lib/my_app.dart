import 'package:dio_http_example/ui/splash_screen.dart';
import 'package:dio_http_example/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(body: const Center(child: SplashScreen())),
    );
  }
}
