import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

// class Classifier {
//   Classifier();

//   classify(String text, String type) async {
//     final classifier = await NLClassifier.createFromAsset(
//         type == 'hate'
//             ? 'assets/model_hate_speech.tflite'
//             : type == 'emotion'
//                 ? 'assets/text_classification_v2.tflite'
//                 : type == 'humor'
//                     ? 'assets/humor_model.tflite'
//                     : 'assets/model_sarcasm.tflite',
//         options: NLClassifierOptions());

//     var prediction = classifier.classify(text);
//   }
// }

class Classifier {
  static final Map<String, String> modelPaths = {
    'hate': 'assets/model_hate_speech.tflite',
    'emotion': 'assets/text_classification_v2.tflite',
    'humor': 'assets/humor_model.tflite',
    'sarcasm': 'assets/model_sarcasm.tflite',
  };

  late Map<String, NLClassifier> classifiers;

  Classifier() {
    classifiers = {};
    initializeModels();
  }

  Future<void> initializeModels() async {
    for (var entry in modelPaths.entries) {
      final type = entry.key;
      final modelPath = entry.value;
      final classifier = await NLClassifier.createFromAsset(
        modelPath,
        options: NLClassifierOptions(),
      );
      classifiers[type] = classifier;
    }
  }

  classify(String text, String type) async {
    final classifier = classifiers[type];
    if (classifier == null) {
      throw Exception('Classifier for type "$type" has not been initialized.');
    }

    return classifier.classify(text);
  }
}



     // 'assets/humor_model.tflite',
        // 'assets/model_hate_speech.tflite',
        // 'assets/model_sarcasm.tflite',
        // 'assets/text_classification_v2.tflite',