import 'package:dio_http_example/ui/ui_pages/settings_page.dart';
import 'package:flutter/material.dart';

class AssetsIcon extends StatefulWidget {
  const AssetsIcon({super.key});

  @override
  State<AssetsIcon> createState() => _AssetsIconState();
}

class _AssetsIconState extends State<AssetsIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
      },
      icon: Icon(Icons.settings),
    );
  }
}
