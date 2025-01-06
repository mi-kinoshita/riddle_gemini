import 'package:flutter/material.dart';
import 'package:riddle_gemini/model/gemini_model.dart';

class RiddlePage extends StatefulWidget {
  const RiddlePage({super.key});

  @override
  State<RiddlePage> createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: theme.surface,
        appBar: AppBar(
          title: Text('Geminiとなぞなぞ'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Center(
                    //   child: FutureBuilder<String>(
                    //     future: geminiModel('こんにちは、Gemini!簡単で短いなぞなぞをひとつ生成してください。'),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.connectionState == ConnectionState.waiting) {
                    //         return CircularProgressIndicator();
                    //       } else if (snapshot.hasError) {
                    //         return Text('Error: ${snapshot.error}');
                    //       } else {
                    //         return Text(
                    //           snapshot.data ?? 'レスポンスなし',
                    //           style: TextStyle(fontWeight: FontWeight.bold),);
                    //       }
                    //     },
                    //   ),
                    // ),
                    Text('Test'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print('push hint button');
                              },
                              child: Text('ヒント')
                          ),
                          SizedBox(width: 15,),
                          ElevatedButton(
                              onPressed: () {
                                print('push answer button');
                              },
                              child: Text('答え')
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(),
                        hintText: '答えを入力',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: Colors.indigoAccent,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}