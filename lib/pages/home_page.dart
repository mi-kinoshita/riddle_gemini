import 'package:flutter/material.dart';
import 'package:riddle_gemini/pages/top_page.dart';
import 'package:riddle_gemini/util/gradient_button.dart';
import 'package:riddle_gemini/util/shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Riddle Gemini'),
            SizedBox(height: 50,),
            GradientButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TopPage()),
                  );
                },
                iconData: Icons.auto_awesome,
                label: 'スタート'
            ),
          ],
        ),
      ),

    );
  }
}
