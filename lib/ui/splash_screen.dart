import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/ui/global_ui_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onThemeChanged});
  final ValueChanged<bool> onThemeChanged;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    context.read<HolidaysBloc>().add(LoadingCountryListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HolidaysBloc, HolidaysState>(
      listener: (context, state) {
        if (state.countryList != null && !state.isLoading) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  GlobalUIPage(onThemeChanged: widget.onThemeChanged),
            ),
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
              child: const Text(
                'HolidayApp',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
