import 'package:flutter/material.dart';
import 'package:riddle_gemini/util/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProfPage extends StatefulWidget {
  const SettingProfPage({super.key});

  @override
  State<SettingProfPage> createState() => _SettingProfPageState();
}

class _SettingProfPageState extends State<SettingProfPage> {
  bool _darkMode = false;
  final List<String> difficultyLevels = ['やさしい', 'ふつう', 'むずかしい'];
  String selectedLevel = 'やさしい'; // Initial selection
  final _textFieldController = TextEditingController();
  String userName = 'name';

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    setState(() {
      userName = SharedPrefs.fetchUserName() ?? 'no name';
      _darkMode = SharedPrefs.fetchDarkMode() ?? false;
      selectedLevel = SharedPrefs.fetchDifficultyLevel() ?? 'やさしい'; // Load difficulty level
    });
  }

  Future<void> _saveSettings() async {
    await SharedPrefs.setUserName(userName);
    await SharedPrefs.setDarkMode(_darkMode);
    await SharedPrefs.setDifficultyLevel(selectedLevel); // Save difficulty level
    print('====user $userName ===darkmode $_darkMode');
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ユーザー名変更'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('ユーザー名を入力してください'),
                TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: userName),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                String newUsername = _textFieldController.text;
                setState(() {
                  userName = newUsername; // Update selected value
                });
                SharedPrefs.setUserName(userName); //
                // ここで newUsername を使ってユーザー名を更新する処理を追加
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        title: Text('ユーザー設定'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('ユーザー名'),
            onTap: () {
              // Navigate to notification settings screen
              _showMyDialog(context);
            },
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: const Icon(Icons.insert_chart),
            title: const Text('モード選択'),
            trailing: DropdownMenu<String>(
              initialSelection: selectedLevel, // Set initial value
              onSelected: (String? newValue) {
                setState(() {
                  selectedLevel = newValue!; // Update selected value
                });
                _saveSettings(); // Save the selected value to preferences
              },
              dropdownMenuEntries: difficultyLevels.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('ダークモード'),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                _saveSettings();
                // Trigger a rebuild of the app to apply the new theme
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('おしらせ'),
            onTap: () {
              // Navigate to notification settings screen
            },
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: const Icon(Icons.insert_comment),
            title: const Text('フィードバック'),
            onTap: () {
              // Navigate to notification settings screen
            },
            trailing: const Icon(Icons.chevron_right),
          ),
          // Add more setting tiles as needed
        ],
      ),
    );
  }
}
