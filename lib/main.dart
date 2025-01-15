import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riddle_gemini/pages/home_page.dart';
import 'package:riddle_gemini/pages/riddle_page.dart';
import 'package:riddle_gemini/pages/setting_prof_page.dart';
import 'package:riddle_gemini/pages/top_page.dart';
import 'package:riddle_gemini/provider/theme_mode_provider.dart';
import 'package:riddle_gemini/util/shared_prefs.dart';
import 'package:riddle_gemini/util/theme.dart';
import 'package:riddle_gemini/util/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Riddle {
  final String riddleText;
  final String answerText;
  final String hintText;

  Riddle(this.riddleText, this.answerText, this.hintText);

  Riddle.fromJson(Map<String, dynamic> json)
      : riddleText = json['riddleText'] as String,
        answerText = json['answerText'] as String,
        hintText = json['hintText'] as String;

  Map<String, dynamic> toJson() => {
    'riddleText': riddleText,
    'answerText': answerText,
    'hintText': hintText,
  };
}

Future<void> jsonControlledGeneration() async {
  final apiKey = dotenv.get('API_KEY');
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }
  // [START json_controlled_generation]
  // Make sure to include this import:
  // import 'package:google_generative_ai/google_generative_ai.dart';
  final schema = Schema.array(
      description: 'List of riddles',
      items: Schema.object(properties: {
        'riddleText':
        Schema.string(description: 'Text of the riddle.', nullable: false),
        'answerText':
        Schema.string(description:  'Text of the answer.', nullable: false),
        'hintText':
        Schema.string(description:  'Text of the hint.', nullable: false),
      }, requiredProperties: [
        'riddleText',
        'answerText',
        'hintText',
      ]));

  final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
          responseMimeType: 'application/json', responseSchema: schema));

  final prompt = 'List a few easy riddles.';
  final response = await model.generateContent([Content.text(prompt)]);
  print(response.text);
  // [END json_controlled_generation]
}

Future main() async {
  await dotenv.load(fileName: ".env");
  await jsonControlledGeneration();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.setPrefsInstance();
  runApp(
      ProviderScope(
          child: MyApp(),
      ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'Riddle Gemini',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      themeMode: themeMode,
      home: HomePage(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static const _screen = [HomePage(), TopPage(), SettingProfPage()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          indicatorColor: theme.inversePrimary,
          selectedIndex: _selectedIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'ホーム',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bar_chart_rounded),
              icon: Icon(Icons.bar_chart),
              label: '成績',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_rounded),
              icon: Icon(Icons.settings),
              label: '設定',
            ),
          ]),
    );
  }
}
