import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_app_state.dart';

class MyAppCubit extends Cubit<MyAppState> {
  MyAppCubit()
      : super(MyAppState(
          themeMode: ThemeModeType.light,
          isMediaPlayerVisible: false,
        ));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void showMediaPlayer() {
    emit(state.copyWith(isMediaPlayerVisible: true));
  }

  void hideMediaPlayer() {
    emit(state.copyWith(isMediaPlayerVisible: false));
  }
}
