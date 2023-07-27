import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertheme/main.dart';
import 'package:rivertheme/theme_mode_state.dart';

class HomeScreen extends ConsumerWidget {
  static String routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData themeData = ref.watch(themeProvider);
    final TextStyle headlineMedium = themeData.textTheme.headlineLarge!;

    if (kDebugMode) {
      print("building home");
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello World",
              style: headlineMedium,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Theme mode'),
              value: ref.watch(themeModeStateProvider) == ThemeMode.light,
              onChanged: (value) {
                ref.watch(themeModeStateProvider.notifier).toggleThemeMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
