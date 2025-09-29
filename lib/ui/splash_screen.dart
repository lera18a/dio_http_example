import 'package:dio_http_example/ui/global_ui_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      //ПРОВЕРКА! Если виджет уже не в дереве — выходим.
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GlobalUIPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/holiday.jpg', fit: BoxFit.fill),
          ),
          Center(
            child: Text('HolidayApp', style: theme.textTheme.headlineLarge),
          ),
        ],
      ),
    );
  }
}
// Center(
//   child: AnimatedOpacity(
//     opacity: 1.0,
//     duration: Duration(milliseconds: 800),
//     child: Text(...),
//   ),
// ),