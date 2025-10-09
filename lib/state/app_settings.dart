import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState extends ChangeNotifier {
  static const _kDarkKey = 'is_dark_mode_enabled';
  ThemeMode _themeMode = ThemeMode.system;
  bool _loaded = false;

  ThemeMode get themeMode => _themeMode;
  bool get isLoaded => _loaded;

  AppSettingsState() {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final hasKey = prefs.containsKey(_kDarkKey);
    if (hasKey) {
      final isDark = prefs.getBool(_kDarkKey) ?? false;
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> toggleDarkMode(bool value) async {
    _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kDarkKey, value);
  }
}
