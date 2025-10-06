import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:dio_http_example/ui/switchs/switch_language/switch_language.dart';
import 'package:dio_http_example/ui/ui_models/switch_model.dart';
import 'package:dio_http_example/ui/switchs/switch_theme/switch_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(context.i18n.themeSettings)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchModel(
                    text1: context.i18n.darkTheme,
                    text2: context.i18n.lightTheme,
                    switchWidget: SwitchThemeSettings(),
                  ),
                  SizedBox(height: 20),
                  SwitchModel(
                    text1: context.i18n.englishLanguage,
                    text2: context.i18n.russianLanguage,
                    switchWidget: SwitchLanguage(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
