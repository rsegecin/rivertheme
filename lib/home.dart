import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rivertheme/main.dart';
import 'package:rivertheme/theme_mode_state.dart';

class HomeScreen extends HookConsumerWidget {
  static String routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);

    if (kDebugMode) {
      print("building home");
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello World",
              style: themeData.textTheme.headlineMedium,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Theme mode'),
              value: ref.watch(themeModeStateProvider) == ThemeMode.light,
              onChanged: (value) {
                ref.read(themeModeStateProvider.notifier).toggleThemeMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
