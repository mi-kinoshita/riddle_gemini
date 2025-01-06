import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _preferences;

  static Future<void> setPrefsInstance() async{
    _preferences ??= await SharedPreferences.getInstance();
  }

  // set
  static Future<void> setUserName(String userName) async{
    await _preferences?.setString('userName', userName);
  }

  static Future<void> setDarkMode(bool darkMode) async{
    await _preferences?.setBool('darkMode', darkMode);
  }

  static Future<void> setDifficultyLevel(String difficultyLevel) async{
    await _preferences?.setString('difficultyLevel', difficultyLevel);
  }

  // fetch
  static String? fetchUserName() {
    return _preferences?.getString('userName');
  }

  static bool? fetchDarkMode() {
    return _preferences?.getBool('darkMode');
  }

  static String? fetchDifficultyLevel() {
    return _preferences?.getString('difficultyLevel');
  }
}