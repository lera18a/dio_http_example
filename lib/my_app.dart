import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:dio_http_example/ui/splash_screen.dart';
import 'package:dio_http_example/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HolidaysBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: state.isLight ? ThemeMode.light : ThemeMode.dark,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
