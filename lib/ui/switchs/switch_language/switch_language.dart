import 'package:dio_http_example/bloc/bloc_language/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({super.key});

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return SizedBox(
          width: 80,
          height: 40,
          child: Transform.scale(
            scale: 1.2,
            child: Switch(
              value: state.local.languageCode == 'ru',
              onChanged: (value) {
                context.read<LanguageBloc>().add(ToggleLanguageEvent());
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
