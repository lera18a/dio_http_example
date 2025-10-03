import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:dio_http_example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HolidaysBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: const MyApp(),
    ),
  );
}
