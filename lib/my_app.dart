import 'package:dio_http_example/bloc/bloc_holidays/holidays_bloc.dart';
import 'package:dio_http_example/bloc/bloc_language/language_bloc.dart';
import 'package:dio_http_example/bloc/bloc_theme/theme_bloc.dart';
import 'package:dio_http_example/enviroment_variables.dart';
import 'package:dio_http_example/extensions/build_context_extensions.dart';
import 'package:dio_http_example/holidays_api_dio_client.dart';
import 'package:dio_http_example/ui/ui_pages/splash_screen_page.dart';
import 'package:dio_http_example/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<HolidaysApiDioClient>(
      create: (_) => HolidaysApiDioClient(
        apiKey: EnviromentVariables.apiKey,
        host: EnviromentVariables.apiHost,
      ),

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HolidaysBloc(apiClient: context.read<HolidaysApiDioClient>()),
          ),
          BlocProvider(
            create: (context) =>
                ThemeBloc(context.read<SharedPreferences>())
                  ..add(ThemeInitEvent()),
          ),
          BlocProvider(
            create: (context) =>
                LanguageBloc(context.read<SharedPreferences>())
                  ..add(LanguageInitEvent()),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themState) {
            return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, languageState) {
                return MaterialApp(
                  locale: languageState.local,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  darkTheme: darkTheme,
                  theme: lightTheme,
                  themeMode: themState.isLight
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  onGenerateTitle: (context) => context.i18n.appTitle,
                  home: SplashScreen(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
