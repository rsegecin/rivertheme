import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_state.g.dart';

@riverpod
class ThemeModeState extends _$ThemeModeState {
  @override
  ThemeMode build() {
    return ThemeMode.dark;
  }

  static ThemeMode getSystemTheme(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    if (mode == ThemeMode.system) {
      if (MediaQuery.of(context).platformBrightness == Brightness.light) {
        mode = ThemeMode.light;
      } else {
        mode = ThemeMode.dark;
      }
    }
    return mode;
  }

  void toggleThemeMode() {
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }
}
