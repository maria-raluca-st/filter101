// // import 'dart:typed_data';
// // import 'package:flutter/services.dart';
// // import 'package:tflite_flutter/tflite_flutter.dart';

// // class Classifier {
// //   Interpreter? _interpreter;
// //   List<String>? _labelList;
// //   Map<String, int>? _labelIndexMap;
// //   int _maxSeqLength;

// //   Classifier({
// //     String modelPath = 'final_model_101.tflite',
// //     String labelPath = 'assets/labels.txt',
// //     int maxSeqLength = 2000,
// //   }) : _maxSeqLength = maxSeqLength {
// //     _loadModel(modelPath);
// //     _loadLabels(labelPath);
// //   }

// //   Future<void> _loadLabels(String labelPath) async {
// //     final labelData = await rootBundle.loadString(labelPath);
// //     _labelList = labelData.split('\n');
// //     _buildLabelIndexMap();
// //   }

// //   void _buildLabelIndexMap() {
// //     _labelIndexMap = {};
// //     for (int i = 0; i < _labelList!.length; i++) {
// //       _labelIndexMap![_labelList![i]] = i;
// //     }
// //   }

// //   Future<void> _loadModel(String modelPath) async {
// //     _interpreter = await Interpreter.fromAsset(modelPath);
// //     _interpreter?.allocateTensors();
// //   }

// //   List<double> _preprocessInput(String text) {
// //     // Preprocess the input text
// //     String cleanedText = text.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
// //     List<String> tokens = cleanedText.split(' ');

// //     // Tokenize and pad the input sequence
// //     List<int> sequence = [];
// //     for (String token in tokens) {
// //       int? index = _labelIndexMap?[token];
// //       if (index != null) {
// //         sequence.add(index + 1); // Add 1 to match label indices
// //       }
// //     }

// //     if (sequence.length > _maxSeqLength) {
// //       sequence = sequence.sublist(0, _maxSeqLength);
// //     } else if (sequence.length < _maxSeqLength) {
// //       int paddingLength = _maxSeqLength - sequence.length;
// //       sequence.addAll(List<int>.filled(paddingLength, 0));
// //     }

// //     // Normalize the input sequence
// //     List<double> normalizedSequence =
// //         sequence.map((value) => value.toDouble()).toList();
// //     return normalizedSequence;
// //   }

// //   String classify(String text) {
// //     if (_interpreter == null) {
// //       throw Exception('Model has not been loaded yet.');
// //     }

// //     List<double> input = _preprocessInput(text);

// //     // Prepare the input tensor
// //     var inputType = TfLiteType.float32;
// //     var inputTensors = _interpreter!.getInputTensors();
// //     if (inputTensors.isEmpty) {
// //       throw Exception('No input tensors found.');
// //     }
// //     var inputTensor = inputTensors[0];
// //     _interpreter!.resizeInputTensor(0, [1, _maxSeqLength]);
// //     _interpreter!.allocateTensors();

// //     // Copy the input data to the input tensor
// //     var inputTensorBuffer = inputTensor.data.buffer;
// //     var inputData = Float32List.fromList(input);
// //     inputTensor.data = inputData.buffer.asUint8List();

// //     // Run the inference
// //     _interpreter!.invoke();

// //     // Retrieve the output tensor
// //     var outputTensors = _interpreter!.getOutputTensors();
// //     if (outputTensors.isEmpty) {
// //       throw Exception('No output tensors found.');
// //     }
// //     var outputTensor = outputTensors[0];

// //     // Get the output data as a List
// //     var outputData = outputTensor.data.buffer.asFloat32List();

// //     // Find the index of the highest prediction
// //     var maxIndex = 0;
// //     var maxValue = outputData[0];
// //     for (var i = 1; i < outputData.length; i++) {
// //       if (outputData[i] > maxValue) {
// //         maxIndex = i;
// //         maxValue = outputData[i];
// //       }
// //     }

// //     // Retrieve the predicted label
// //     var predictionLabel = _labelList![maxIndex];

// //     return predictionLabel;
// //   }
// // }

// // ---------------------------------------

// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:filter101/utils/nltktokenizer.dart';
// import 'package:flutter/services.dart';
// import 'package:lemmatizerx/lemmatizerx.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// class Classifier {
//   var stopWords = {
//     'or',
//     'out',
//     'a',
//     'same',
//     "that'll",
//     'them',
//     'on',
//     'there',
//     'just',
//     'needn',
//     'am',
//     'yourselves',
//     "don't",
//     'have',
//     'ourselves',
//     'wasn',
//     'we',
//     'is',
//     'yourself',
//     'such',
//     'were',
//     'down',
//     'under',
//     "you've",
//     'an',
//     'herself',
//     'before',
//     'hasn',
//     'me',
//     'those',
//     'hers',
//     'below',
//     'itself',
//     'no',
//     "wasn't",
//     'who',
//     "she's",
//     'shan',
//     "hasn't",
//     'did',
//     'isn',
//     "wouldn't",
//     're',
//     'about',
//     'my',
//     'whom',
//     'him',
//     'by',
//     'so',
//     'their',
//     'its',
//     'will',
//     'because',
//     'how',
//     'than',
//     'shouldn',
//     'his',
//     'through',
//     'why',
//     'y',
//     'themselves',
//     'should',
//     'few',
//     'further',
//     'other',
//     'hadn',
//     'does',
//     'yours',
//     "mightn't",
//     "should've",
//     'ain',
//     't',
//     'both',
//     's',
//     'above',
//     'for',
//     'be',
//     'weren',
//     'your',
//     'mustn',
//     'aren',
//     'what',
//     'but',
//     'again',
//     'been',
//     've',
//     "weren't",
//     'any',
//     'during',
//     'here',
//     'wouldn',
//     'won',
//     'i',
//     'o',
//     'that',
//     'the',
//     "you'd",
//     'this',
//     'some',
//     'only',
//     'doing',
//     "doesn't",
//     'haven',
//     "aren't",
//     'our',
//     'her',
//     'all',
//     'ours',
//     'where',
//     'as',
//     'it',
//     'was',
//     "didn't",
//     'if',
//     'nor',
//     'can',
//     'd',
//     'he',
//     'own',
//     "isn't",
//     'theirs',
//     "couldn't",
//     'ma',
//     'll',
//     'from',
//     'at',
//     'of',
//     'between',
//     'after',
//     'over',
//     "you're",
//     'you',
//     "haven't",
//     'up',
//     'are',
//     'once',
//     'myself',
//     'which',
//     'couldn',
//     "shan't",
//     'not',
//     'while',
//     'most',
//     "needn't",
//     'until',
//     'now',
//     'too',
//     'didn',
//     'and',
//     'she',
//     'each',
//     'having',
//     "shouldn't",
//     'off',
//     'had',
//     'more',
//     'in',
//     "mustn't",
//     'very',
//     'do',
//     'into',
//     'don',
//     'm',
//     'these',
//     "won't",
//     'mightn',
//     'being',
//     "it's",
//     'they',
//     "hadn't",
//     'to',
//     'when',
//     'has',
//     'then',
//     "you'll",
//     'against',
//     'with',
//     'himself',
//     'doesn'
//   };
//   Interpreter? _interpreter;
//   List<String>? _labelList;
//   Map<String, int>? _labelIndexMap;
//   int _maxSeqLength;

//   Classifier({
//     String modelPath = 'final_model_101.tflite',
//     String labelPath = 'assets/labels.txt',
//     int maxSeqLength = 2000,
//   }) : _maxSeqLength = maxSeqLength {
//     _loadModel(modelPath);
//     _loadLabels(labelPath);
//   }

//   Future<void> _loadLabels(String labelPath) async {
//     final labelData = await rootBundle.loadString(labelPath);
//     _labelList =
//         labelData.split('\n').where((label) => label.isNotEmpty).toList();
//     _buildLabelIndexMap();
//   }

//   void _buildLabelIndexMap() {
//     _labelIndexMap = {};
//     for (int i = 0; i < _labelList!.length; i++) {
//       String label = _labelList![i].trim();
//       if (label.isNotEmpty) {
//         _labelIndexMap![label] = i;
//       }
//     }
//   }

//   List<String> wordTokenize(String text) {
//     List<String> sentences = text.split(RegExp(r'(?<=[.!?])\s+'));
//     List<String> tokens = [];

//     for (String sentence in sentences) {
//       List<String> words = sentence.split(RegExp(r'\s+'));
//       tokens.addAll(words);
//     }

//     return tokens;
//   }

//   Future<void> _loadModel(String modelPath) async {
//     _interpreter = await Interpreter.fromAsset(modelPath);
//     _interpreter?.allocateTensors();
//   }

//   List<double> _preprocessInput(String text) {
//     // Preprocess the input text
//     String cleanedText = text.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), '');
//     List<String> tokens = cleanedText.split(' ');

//     // Tokenize and pad the input sequence
//     List<int> sequence = [];
//     for (String token in tokens) {
//       int? index = _labelIndexMap?[token];
//       if (index != null) {
//         sequence.add(index + 1); // Add 1 to match label indices
//       }
//     }

//     if (sequence.length > _maxSeqLength) {
//       sequence = sequence.sublist(0, _maxSeqLength);
//     } else if (sequence.length < _maxSeqLength) {
//       int paddingLength = _maxSeqLength - sequence.length;
//       sequence.addAll(List<int>.filled(paddingLength, 0));
//     }

//     // Normalize the input sequence
//     List<double> normalizedSequence =
//         sequence.map((value) => value.toDouble()).toList();
//     return normalizedSequence;
//   }

//   String classify(String text) {
//     if (_interpreter == null) {
//       throw Exception('Model has not been loaded yet.');
//     }

//     List<double> input = _preprocessInput(text);

//     // Prepare the input tensor
//     var inputType = TfLiteType.float32;
//     var inputTensors = _interpreter!.getInputTensors();
//     if (inputTensors.isEmpty) {
//       throw Exception('No input tensors found.');
//     }
//     var inputTensor = inputTensors[0];
//     _interpreter!.resizeInputTensor(0, [1, _maxSeqLength]);
//     _interpreter!.allocateTensors();

//     // Copy the input data to the input tensor
//     print('Before Input Data Assignment: ${inputTensor.data}');
//     var inputTensorBuffer = inputTensor.data.buffer;
//     var inputData = Float32List.fromList(input);
//     inputTensor.data = inputData.buffer.asUint8List();
//     print('After Input Data Assignment: ${inputTensor.data}');
//     print('Input Tensor Shape: ${inputTensor.shape}');
//     print('Input Tensor Type: ${inputTensor.type}');
//     print('Input Data: $inputData');

//     // Run the inference
//     _interpreter!.invoke();

//     // Retrieve the output tensor
//     var outputTensors = _interpreter!.getOutputTensors();
//     if (outputTensors.isEmpty) {
//       throw Exception('No output tensors found.');
//     }
//     var outputTensor = outputTensors[0];

//     // Get the output data as a List
//     var outputData = outputTensor.data.buffer.asFloat32List();

//     // Find the index of the highest prediction
//     var maxIndex = 0;
//     var maxValue = outputData[0];
//     for (var i = 1; i < outputData.length; i++) {
//       if (outputData[i] > maxValue) {
//         maxIndex = i;
//         maxValue = outputData[i];
//       }
//     }

//     // Retrieve the predicted label
//     var predictionLabel = _labelList![maxIndex];
//     print(_labelList);
//     return predictionLabel;
//   }

//   // String _preprocessText(String rawText) {
//   //   // Convert raw text to lowercase
//   //   String preprocessedText = rawText.toLowerCase();

//   //   // Remove punctuation
//   //   preprocessedText = preprocessedText.replaceAll(RegExp(r'[^\w\s]+'), '');

//   //   // Remove stop words
//   //   List<String> words = preprocessedText.split(' ');
//   //   words = words.where((word) => !stopWords.contains(word)).toList();

//   //   // Lemmatize words
//   //   Lemmatizer lemmatizer = Lemmatizer();
//   //   List lemmatizedWords =
//   //       words.map((word) => lemmatizer.lemma(word, POS.NOUN)).toList();

//   //   // Tokenize the preprocessed text
//   //   String preprocessedSentence = lemmatizedWords.join(' ');

//   //   // Encode tokens using the tokenizer vocabulary
//   //   // List<int> encodedSequence = textsToSequences(preprocessedSentence);
//   //   List<String> encodedSequence =
//   //       NLTKWordTokenizer().tokenize(preprocessedSentence);

//   //   // Convert the encoded sequence to a JSON string
//   //   String sequenceJson = json.encode(encodedSequence);

//   //   return sequenceJson;
//   // }

//   // List<int> textsToSequences(String sentence) {
//   //   // Replace with your tokenizer implementation logic
//   //   return [];
//   // }

//   // List<List<int>> padSequences(List<List<int>> sequences,
//   //     {int? maxlen,
//   //     int value = 0,
//   //     bool padding = true,
//   //     bool truncating = false}) {
//   //   int numTimesteps = maxlen ?? _getMaxSequenceLength(sequences);
//   //   List<List<int>> paddedSequences = [];

//   //   for (List<int> sequence in sequences) {
//   //     List<int> paddedSequence;

//   //     if (padding) {
//   //       paddedSequence = _padSequence(sequence, numTimesteps, value);
//   //     } else {
//   //       paddedSequence = _truncateSequence(sequence, numTimesteps);
//   //     }

//   //     paddedSequences.add(paddedSequence);
//   //   }

//   //   return paddedSequences;
//   // }

//   // int _getMaxSequenceLength(List<List<int>> sequences) {
//   //   int maxLength = 0;

//   //   for (List<int> sequence in sequences) {
//   //     if (sequence.length > maxLength) {
//   //       maxLength = sequence.length;
//   //     }
//   //   }

//   //   return maxLength;
//   // }

//   // List<int> _padSequence(List<int> sequence, int numTimesteps, int value) {
//   //   int sequenceLength = sequence.length;

//   //   if (sequenceLength >= numTimesteps) {
//   //     return sequence.sublist(0, numTimesteps);
//   //   } else {
//   //     List<int> paddedSequence = List.filled(numTimesteps, value);
//   //     paddedSequence.replaceRange(0, sequenceLength, sequence);
//   //     return paddedSequence;
//   //   }
//   // }

//   // List<int> _truncateSequence(List<int> sequence, int numTimesteps) {
//   //   if (sequence.length <= numTimesteps) {
//   //     return sequence;
//   //   } else {
//   //     return sequence.sublist(0, numTimesteps);
//   //   }
//   // }
// }

import 'package:tflite_flutter_helper_plus/tflite_flutter_helper_plus.dart';

class Classifier {
  Classifier() {}

  classify(String text) async {
    final classifier = await NLClassifier.createFromAsset(
        'assets/final_model_cleaned.tflite',
        options: NLClassifierOptions());

    return classifier.classify(text);
  }
}
