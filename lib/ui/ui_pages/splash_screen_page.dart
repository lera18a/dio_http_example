import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:dio_http_example/ui/ui_pages/global_ui_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<HolidaysBloc, HolidaysState>(
      listener: (context, state) {
        if (state.countryList != null && !state.isLoading) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GlobalUIPage()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/holiday.jpg', fit: BoxFit.fill),
            ),
            Center(
              child: Text(
                context.i18n.startTitle,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
