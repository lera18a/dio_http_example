import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    (BlocProvider(create: (context) => HolidaysBloc(), child: const MyApp())),
  );
}
