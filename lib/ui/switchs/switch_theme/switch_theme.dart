import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchThemeSettings extends StatefulWidget {
  const SwitchThemeSettings({super.key});

  @override
  State<SwitchThemeSettings> createState() => _SwitchThemeSettingsState();
}

class _SwitchThemeSettingsState extends State<SwitchThemeSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SizedBox(
          width: 80,
          height: 40,
          child: Transform.scale(
            scale: 1.2,
            child: Switch(
              value: state.isLight,
              onChanged: (value) {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeThumbColor: Colors.green,
            ),
          ),
        );
      },
    );
  }
}
