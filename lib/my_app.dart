import 'package:dio_http_example/ui/global_ui_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const Center(child: GlobalUIPage())),
    );
  }
}
