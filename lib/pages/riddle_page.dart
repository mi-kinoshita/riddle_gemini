import 'package:flutter/material.dart';
import 'package:riddle_gemini/model/gemini_model.dart';
import 'package:riddle_gemini/pages/answer_page.dart';

class RiddlePage extends StatefulWidget {
  const RiddlePage({super.key});

  @override
  State<RiddlePage> createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final TextEditingController controller = TextEditingController();
  bool topRightSelected = false;
  bool bottomRightSelected = false;
  bool topLeftSelected = false;
  bool bottomLeftSelected = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    Future<void> showMyDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ヒント'),
            content: SingleChildScrollView(
              child: const Text('ここにヒントが表示されます。'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('閉じる'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: theme.surface,
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close)),
          actions: [
            IconButton(
                onPressed: () {
                  showMyDialog(context);
                },
                icon: Icon(Icons.help_outline),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: Colors.lightBlueAccent,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('ここに問題文が表示されます。',
                          style: TextStyle(fontWeight: FontWeight.bold),),
                          // FutureBuilder<String>(
                          //   future: geminiModel('こんにちは、Gemini!簡単で短いなぞなぞをひとつ生成してください。'),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState == ConnectionState.waiting) {
                          //       return CircularProgressIndicator();
                          //     } else if (snapshot.hasError) {
                          //       return Text('Error: ${snapshot.error}');
                          //     } else {
                          //       return Text(
                          //         snapshot.data ?? 'レスポンスなし',
                          //         style: TextStyle(fontWeight: FontWeight.bold),);
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: topRightSelected ? theme.inversePrimary : theme.surface,
                            border: Border.all(color: theme.outlineVariant),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      topRightSelected = !topRightSelected;
                                      topLeftSelected = false;
                                      bottomRightSelected = false;
                                      bottomLeftSelected = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.mood,
                                    color: Colors.green,
                                    size: 100,
                                  ),
                              ),
                              Text('Smile'),
                            ],
                          ),

                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: topLeftSelected ? theme.inversePrimary : theme.surface,
                            border: Border.all(color: theme.outlineVariant),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    topRightSelected = false;
                                    topLeftSelected = !topLeftSelected;
                                    bottomRightSelected = false;
                                    bottomLeftSelected = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.sunny,
                                  color: Colors.lime,
                                  size: 100,
                                ),
                              ),
                              Text('Sun'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: bottomRightSelected ? theme.inversePrimary : theme.surface,
                            border: Border.all(color: theme.outlineVariant),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    topRightSelected = false;
                                    topLeftSelected = false;
                                    bottomRightSelected = !bottomRightSelected;
                                    bottomLeftSelected = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                  size: 100,
                                ),
                              ),
                              Text('Heart'),
                            ],
                          ),

                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: bottomLeftSelected ? theme.inversePrimary : theme.surface,
                            border: Border.all(color: theme.outlineVariant),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    topRightSelected = false;
                                    topLeftSelected = false;
                                    bottomRightSelected = false;
                                    bottomLeftSelected = !bottomLeftSelected;
                                  });
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 100,
                                ),
                              ),
                              Text('Star'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: theme.inversePrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AnswerPage()),
                            );
                          },
                          child: Text('答える'),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      );
  }
}