import 'package:dio_http_example/ui/theme/theme_models/switch_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({
    super.key,
    required this.initialTheme,
    required this.onThemeChanged,
  });
  final bool initialTheme;
  final ValueChanged<bool> onThemeChanged;
  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.initialTheme; // ← инициализируем из параметра
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройка темы')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Темная тема',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                  SwitchModel(
                    value: isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        isSwitched = value;
                      });
                      widget.onThemeChanged(value);
                    },
                  ),
                  Text(
                    'Светлая тема',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
