import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  return ThemeModeController();
});

class ThemeModeController extends StateNotifier<ThemeMode> {
  static const String themeModeKey = 'theme_mode';

  ThemeModeController() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedMode = prefs.getString(themeModeKey);
    if (loadedMode != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.toString().split('.').last == loadedMode,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> toggle() async {
    final prefs = await SharedPreferences.getInstance();
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await prefs.setString(themeModeKey, newMode.toString().split('.').last);
    print('new mode : $newMode');
    state = newMode;
  }
}
