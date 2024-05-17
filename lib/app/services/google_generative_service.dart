import 'dart:io';

import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GoogleGenerativeService extends GetxService {
  RxString output = ''.obs;
  RxBool isLoading = false.obs;
  File _image = File('');
  set image(File image) => _image = image;
  void setPrompt(String prompt) async {
    if (prompt.isEmpty) return;

    isLoading.value = true;
    output.value = '';

    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyBWTtO8ws1Vy46kDgujZvjnbwrUwxLUpXI',
    );

    final content = [
      Content.text(prompt),
      //   if (_image != null) Content.image(_image!.readAsBytesSync()),
      Content.multi([
        // DataPart('image/jpeg', _image.readAsBytesSync()),
        TextPart(
            'if has question about you u must response like introduce your self'),
        TextPart(
            'Your name Is Ahmad and you are is a software engineer at Google'),

        TextPart(prompt)
      ])
    ];

    model.generateContentStream(
      content,
      generationConfig: GenerationConfig(
        temperature: 0.4,
        topK: 32,
        topP: 1,
        maxOutputTokens: 4096,
      ),
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
      ],
    ).listen((event) {
      if (event.text != null) {
        output.value += event.text!;
        output.refresh();
      }
    }, onDone: () {
      isLoading.value = false;
    });
  }
}
