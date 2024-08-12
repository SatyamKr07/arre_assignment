enum ThemeModeType { light, dark }

class MyAppState {
  final ThemeModeType themeMode;
  bool isMediaPlayerVisible = false;

  MyAppState({
    required this.themeMode,
    required this.isMediaPlayerVisible,
  });

  MyAppState copyWith({
    ThemeModeType? themeMode,
    bool? isMediaPlayerVisible,
  }) {
    return MyAppState(
      themeMode: themeMode ?? this.themeMode,
      isMediaPlayerVisible: isMediaPlayerVisible ?? this.isMediaPlayerVisible,
    );
  }
}
