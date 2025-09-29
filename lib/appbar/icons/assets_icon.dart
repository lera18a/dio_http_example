import 'package:dio_http_example/ui/theme/theme_settings_page.dart';
import 'package:flutter/material.dart';

class AssetsIcon extends StatefulWidget {
  const AssetsIcon({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;

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
          MaterialPageRoute(
            builder: (context) => ThemeSettingsPage(
              initialTheme: false,
              onThemeChanged: widget.onThemeChanged,
            ),
          ),
        );
      },
      icon: Icon(Icons.settings),
    );
  }
}
