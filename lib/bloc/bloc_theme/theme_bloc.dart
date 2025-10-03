import 'package:bloc/bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isLight: true)) {
    on<ToggleThemeEvent>(_onToggleThemeEvent);
  }

  void _onToggleThemeEvent(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    emit(ThemeState(isLight: !state.isLight));
  }
}
