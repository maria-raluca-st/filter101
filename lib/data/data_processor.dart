// import 'package:ml_dataframe/ml_dataframe.dart';
// import 'package:ml_preprocessing/ml_preprocessing.dart';

// class DataProcessor {
//   DataFrame preprocessText(String text) {
//     final data = DataFrame.fromSeries(
//       [Series.fromStrings(text.split('\n'), name: 'text')],
//       headerExists: true,
//       header: ['text'],
//     );
//     final preprocessedData = preprocessData(data);
//     return preprocessedData;
//   }

//   DataFrame preprocessData(DataFrame data) {
//     final lowercaseTransformer = TextTransformer(
//       inputCols: ['text'],
//       outputCols: ['lowercase_text'],
//       toLowerCase: true,
//     );
//     final punctuationRemover = TextTransformer(
//       inputCols: ['lowercase_text'],
//       outputCols: ['cleaned_text'],
//       customOperation: (String text) {
//         return text.replaceAll(RegExp('[^a-zA-Z\\s]'), '');
//       },
//     );
//     final tokenizer = Tokenizer(
//       inputCol: 'cleaned_text',
//       outputCol: 'tokens',
//     );
//     final stopWordsRemover = StopWordsRemover(
//       inputCol: 'tokens',
//       outputCol: 'preprocessed_text',
//       stopWords: StopWords.english(),
//     );

//     final pipeline = TransformerPipeline(
//       transformers: [
//         lowercaseTransformer,
//         punctuationRemover,
//         tokenizer,
//         stopWordsRemover,
//       ],
//     );

//     final preprocessedData = pipeline.fit(data).transform(data);
//     return preprocessedData;
//   }
// }
