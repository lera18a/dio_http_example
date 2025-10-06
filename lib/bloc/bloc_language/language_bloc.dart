import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(local: Locale('ru'))) {
    on<ToggleLanguageEvent>(_onToggleLanguageEvent);
  }

  void _onToggleLanguageEvent(
    ToggleLanguageEvent event,
    Emitter<LanguageState> emit,
  ) {
    final locate = state.local.languageCode == 'en'
        ? const Locale('ru')
        : const Locale('en');
    emit(LanguageState(local: locate));
  }
}
