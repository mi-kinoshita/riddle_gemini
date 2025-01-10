import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String answer;
  final String sentence;
  final String commentary;
  final String userAnswer;
  final String advice;
  final IconData answerIcon;
  final Color answerColor;

  const AnswerTile({
    super.key,
    required this.answer,
    required this.sentence,
    required this.commentary,
    required this.userAnswer,
    required this.advice,
    required this.answerIcon,
    required this.answerColor,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    var solutionSession = Column(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('問題文', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(sentence,),
        ),
        Text('あなたの解答', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(userAnswer,),
        ),
        Text('解答', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(answer,),
        ),
        Text('解説', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(commentary,),
        ),
      ],
    );

    var adviceSession =  Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 4,
      children: [
        SizedBox(height: 40,),
        const Icon(Icons.comment, color: Colors.blue, size: 12),
        Text(advice, style: const TextStyle(fontSize: 12, height: 1,)),
      ],
    );

    var item = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              solutionSession,
              adviceSession,
            ],
          ),
        ),
      ],
    );
    var resultTileDesign = Card(
      color: theme.surface,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: item,
        ));
    return resultTileDesign;
  }
}
