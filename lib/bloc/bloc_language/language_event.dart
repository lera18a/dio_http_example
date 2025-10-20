part of 'language_bloc.dart';

sealed class LanguageEvent {}

class ToggleLanguageEvent extends LanguageEvent {}

class LanguageInitEvent extends LanguageEvent {}
