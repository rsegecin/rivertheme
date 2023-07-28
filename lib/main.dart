import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertheme/home.dart';
import 'package:rivertheme/theme_mode_state.dart';

final themeProvider = Provider<ThemeData>(
  (ref) => throw UnimplementedError(),
  dependencies: const [],
);

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeStateProvider);
    final ThemeData themeLight =
        FlexThemeData.light(scheme: FlexScheme.mandyRed);
    final ThemeData themeDark = FlexThemeData.dark(scheme: FlexScheme.mandyRed);
    final ThemeData themeData = (themeMode == ThemeMode.light)
        ? localizeThemeData(context, themeLight)
        : localizeThemeData(context, themeDark);

    if (kDebugMode) {
      print("building app");
    }

    return MaterialApp(
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: themeMode,
      builder: (context, child) {
        return ProviderScope(
          overrides: [themeProvider.overrideWithValue(themeData)],
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }

  static ThemeData localizeThemeData(
      BuildContext context, ThemeData themeData) {
    final MaterialLocalizations? localizations =
        Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    final ScriptCategory category =
        localizations?.scriptCategory ?? ScriptCategory.englishLike;
    return ThemeData.localize(
        themeData, themeData.typography.geometryThemeFor(category));
  }
}
