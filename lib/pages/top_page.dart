import 'package:flutter/material.dart';
import 'package:riddle_gemini/pages/riddle_page.dart';
import 'package:riddle_gemini/util/exercise_tile.dart';
import 'package:riddle_gemini/util/gradient_button.dart';
import 'package:riddle_gemini/util/shared_prefs.dart';

import '../util/sections/title_section.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  String userName = '';

  Future<void> _loadUserName() async {
    setState(() {
      userName = SharedPrefs.fetchUserName() ?? 'no name';
    });
    print('=== TOPPAGE: _loadUserName: $userName');// Update the ValueNotifier
  }

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  //
  // Widget _buildHeatMap() {
  //   return FutureBuilder<DateTime?>(
  //     future: ,
  //     builder: ,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: theme.surface,
          floatingActionButton: GradientButton(
            onPressed: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => RiddlePage()
            ),),
            iconData: Icons.auto_awesome,
            label: 'クイズを生成',
          ),
          body: SafeArea(
            child: Column(
              children: [
                TitleSection(),
                ExerciseTile(
                    onTap: () {

                    },
                    iconData: Icons.pets,
                    exerciseName: 'どうぶつクイズ',
                    numberOfExercises: 8,
                ),

                ],
            ),
          ),
          ),
      );
  }
}


