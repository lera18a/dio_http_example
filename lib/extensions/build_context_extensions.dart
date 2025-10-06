import 'package:dio_http_example/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

//взяли класс и добавили туда метод- extension!
extension BuildContextExtensions on BuildContext {
  AppLocalizations get i18n => AppLocalizations.of(this)!;
}
