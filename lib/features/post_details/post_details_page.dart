// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:ml_dataframe/ml_dataframe.dart';
// import 'package:ml_preprocessing/ml_preprocessing.dart';
// import 'package:pytorch_mobile/pytorch_mobile.dart';
// import 'dart:typed_data';
// import '../../data/comment.dart';
// import '../../data/post.dart';
// import '../../network/reddit_service.dart';

// class PostDetailsPage extends StatefulWidget {
//   final RedditPost post;

//   PostDetailsPage({required this.post});

//   @override
//   _PostDetailsPageState createState() => _PostDetailsPageState();
// }

// class _PostDetailsPageState extends State<PostDetailsPage> {
//   DataFrame? dataFrame;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchPostsWithComments();
//   }

//   Future<void> fetchPostsWithComments() async {
//     try {
//       // Fetch the last 50 posts from the subreddit
//       List<RedditPost> posts =
//           await RedditService.fetchPosts(widget.post.subreddit, limit: 50);

//       List<RedditComment> allComments = [];

//       // Fetch comments for each post
//       for (var post in posts) {
//         List<RedditComment> comments =
//             await RedditService.fetchComments(post.id);
//         allComments.addAll(comments);
//       }

//       // Create a DataFrame with posts and comments
//       dataFrame = createDataFrame(posts, allComments);

//       // Perform preprocessing on the DataFrame
//       if (dataFrame != null) {
//         preprocessData();
//       }

//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   DataFrame createDataFrame(
//       List<RedditPost> posts, List<RedditComment> comments) {
//     List<String> texts = [];

//     for (var post in posts) {
//       texts.add(post.title);
//       texts.add(post.selftext);
//     }

//     for (var comment in comments) {
//       texts.add(comment.body);
//     }

//     return DataFrame.fromSeries([Series('text', texts)]);
//   }

//   void preprocessData() {
//     try {
//       final df = dataFrame!;

//       // Load the preprocessing pipeline
//       const pipelinePath = 'assets/models/preprocessing.pkl';
//       final pipelineBytes = rootBundle.load(pipelinePath);
//       final pipeline =
//           PreprocessingPipeline.fromBytes(pipelineBytes.buffer.asUint8List());

//       // Apply the preprocessing pipeline to the DataFrame
//       final preprocessedData = pipeline.transform(df);

//       dataFrame = preprocessedData;
//     } catch (e, stackTrace) {
//       print('Error during data preprocessing: $e\n$stackTrace');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post Details'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: dataFrame!.rows.length,
//                     itemBuilder: (context, index) {
//                       final row = dataFrame!.rows.toList()[index];

//                       final rowList = row.toList();
//                       final text = rowList[0];

//                       return ListTile(
//                         title: Text(text),
//                       );
//                     },
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Evaluate the preprocessed texts with PyTorch Mobile model
//                     evaluateWithPyTorchMobile();
//                   },
//                   child: Text('Evaluate with Model'),
//                 ),
//               ],
//             ),
//     );
//   }

//   void evaluateWithPyTorchMobile() async {
//     try {
// // Convert the preprocessed texts to a List<String>
//       List<String> texts = dataFrame!.column('text').toList().cast<String>();
//       // Load the PyTorch Mobile model
//       final modelPath = 'assets/model_suicide.pkl';
//       final modelBytes = await rootBundle.load(modelPath);
//       final model =
//           await PyTorchMobile.loadModel(modelBytes.buffer.asUint8List());

//       // Load the TF-IDF vectorizer
//       final vectorizerPath = 'assets/tfidf.pkl';
//       final vectorizerBytes = await rootBundle.load(vectorizerPath);
//       final vectorizer =
//           TfidfVectorizer.fromBytes(vectorizerBytes.buffer.asUint8List());

//       // Preprocess and vectorize the texts
//       final preprocessedTexts = vectorizer.transform(texts);

//       // Convert the preprocessed texts to a DataFrame
//       final preprocessedData = DataFrame.fromMatrix(
//         preprocessedTexts,
//         header: ['text'],
//       );

//       // Perform inference on the preprocessed data using the loaded model
//       final predictions = await model.getPrediction(preprocessedData);

//       // Process the predictions as per your requirement
//       processPredictions(predictions);

//       // Dispose the model after use
//       model.dispose();
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   void processPredictions(List<dynamic> predictions) {
// // Process the predictions as per your requirement
// // For example, update the UI or perform further analysis
//     for (int i = 0; i < dataFrame!.rows.length; i++) {
//       final prediction = predictions[i];

//       // Update the UI or perform further analysis based on the prediction
//       final row = dataFrame!.row(i);
//       final text = row['text'];
//       print('Text: $text, Prediction: $prediction');
//     }
//   }
// }
