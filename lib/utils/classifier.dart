import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

class Classifier {
  Classifier();

  classify(String text, String type) async {
    final classifier = await NLClassifier.createFromAsset(
        type == 'hate'
            ? 'assets/model_hate_speech.tflite'
            : type == 'emotion'
                ? 'assets/text_classification_v2.tflite'
                : type == 'humor'
                    ? 'assets/humor_model.tflite'
                    : 'assets/model_sarcasm.tflite',
        options: NLClassifierOptions());

    var prediction = classifier.classify(text);
    print(prediction[1].score);
    print(prediction[0].score);
  }
}


     // 'assets/humor_model.tflite',
        // 'assets/model_hate_speech.tflite',
        // 'assets/model_sarcasm.tflite',
        // 'assets/text_classification_v2.tflite',