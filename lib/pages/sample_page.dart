import 'package:flutter/material.dart';
import 'package:riddle_gemini/model/gemini_model.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Gemini Generator'),),
        body: Center(
          // child: FutureBuilder<String>(
          //   future: geminiModel('Hello, Gemini!'),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState. waiting) {
          //       return CircularProgressIndicator();
          //     } else if (snapshot.hasError){
          //       return Text('Error: ${snapshot.error}');
          //     } else {
          //       return Text(snapshot.data ?? 'No response');
          //     }
          //   },
          // )
        ),
      ),
    );
  }
}
