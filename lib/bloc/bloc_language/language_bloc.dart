import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this.prefs) : super(LanguageState(local: Locale('ru'))) {
    on<ToggleLanguageEvent>(_onToggleLanguageEvent);
    on<LanguageInitEvent>(_onLanguageInitEvent);
  }
  static const _langKey = 'language';
  final SharedPreferences prefs;

  Future<void> _onToggleLanguageEvent(
    ToggleLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final locate = state.local.languageCode == 'en'
        ? const Locale('ru')
        : const Locale('en');
    emit(LanguageState(local: locate));
    await prefs.setString(_langKey, locate.languageCode);
  }

  void _onLanguageInitEvent(
    LanguageInitEvent event,
    Emitter<LanguageState> emit,
  ) {
    final saved = prefs.getString(_langKey);
    if (saved != null && saved.isNotEmpty) {
      emit(LanguageState(local: Locale(saved)));
    }
  }
}
