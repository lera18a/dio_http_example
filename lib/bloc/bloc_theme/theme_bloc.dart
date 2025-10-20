import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.prefs) : super(ThemeState(isLight: true)) {
    on<ToggleThemeEvent>(_onToggleThemeEvent);
    on<ThemeInitEvent>(_onThemeInitEvent);
  }

  final SharedPreferences prefs;
  static const _themeKey = 'theme';

  Future<void> _onToggleThemeEvent(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final finalState = !state.isLight;
    emit(ThemeState(isLight: finalState));
    await prefs.setBool(_themeKey, finalState);
  }

  void _onThemeInitEvent(ThemeInitEvent event, Emitter<ThemeState> emit) {
    final saved = prefs.getBool(_themeKey);
    if (saved == null || saved == state.isLight) return;
    emit(ThemeState(isLight: saved));
  }
}
