import 'package:flutter/material.dart';
import 'package:riddle_gemini/pages/riddle_page.dart';
import 'package:riddle_gemini/util/answer_tile.dart';
import 'package:riddle_gemini/util/gradient_button.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  bool checkAnswer = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        actions: [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Image.asset(
                  width: 100,
                  checkAnswer ? 'assets/images/happy.png' : 'assets/images/sad.png'
              ),
              AnswerTile(
                answerIcon: checkAnswer ? Icons.circle_outlined : Icons.close,
                answerColor: checkAnswer ? Colors.red : Colors.blue,
                answer: checkAnswer ? '正解' : '残念',
                sentence: '問題文が表示されます。',
                commentary: '解説文が表示されます。',
                userAnswer: 'ユーザーの回答が表示されます。',
                advice: 'アドバイスが表示されます。',
              ),
              SizedBox(
                height: 20,
              ),
              GradientButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RiddlePage()),
                    );
                  },
                  iconData: Icons.auto_awesome,
                  label: 'もう一度クイズ'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
