import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<String> geminiModel(String inputText) async {
  var apiKey = dotenv.get('API_KEY');
    if(apiKey == null) {
      log('No API_KEY environment variable');
      exit(1);
    }

    final model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);
    final content = [Content.text(inputText)];
    final response = await model.generateContent(content);

    String resText = response.text ?? 'No response text';
    log(resText);

    return resText;
}