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

    if (kDebugMode) {
      print("building app");
    }

    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: themeMode,
      builder: (context, child) {
        final theme = Theme.of(context);
        return ProviderScope(
          overrides: [
            themeProvider.overrideWithValue(theme),
          ],
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}
