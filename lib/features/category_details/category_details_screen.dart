// import 'package:filter101/constants/colour.dart';
// import 'package:filter101/constants/text_style.dart';
// import 'package:filter101/coordinator.dart';
// import 'package:filter101/data/comment.dart';
// import 'package:filter101/data/post.dart';
// import 'package:filter101/routes.dart';
// import 'package:flutter/material.dart';

// class CategoryDetailsScreen extends StatefulWidget {
//   final String category;
//   final List<RedditPost> posts;
//   final List<RedditComment> comments;

//   const CategoryDetailsScreen({
//     required this.category,
//     required this.posts,
//     required this.comments,
//   });

//   @override
//   _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
// }

// class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
//   Set<String> displayedTexts = {}; // Set to track displayed texts

//   @override
//   Widget build(BuildContext context) {
//     // Filter posts and comments with non-zero probability
//     final filteredPosts = widget.posts.where((post) {
//       var postProbability = _getPostProbability(post);
//       return postProbability != 0.00;
//     }).toList();

//     final filteredComments = widget.comments.where((comment) {
//       var commentProbability = _getCommentProbability(comment);
//       return commentProbability != 0.00;
//     }).toList();

//     // Sort posts and comments in descending order based on probability
//     filteredPosts.sort((a, b) {
//       var aProbability = _getPostProbability(a);
//       var bProbability = _getPostProbability(b);
//       return bProbability.compareTo(aProbability);
//     });

//     filteredComments.sort((a, b) {
//       var aProbability = _getCommentProbability(a);
//       var bProbability = _getCommentProbability(b);
//       return bProbability.compareTo(aProbability);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _getCategoryName(widget.category),
//           style: TextStyles.heading(
//             color: Colour.white,
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colour.hunterGreen,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredPosts.length,
//               itemBuilder: (context, index) {
//                 final post = filteredPosts[index];
//                 final postProbability = _getPostProbability(post);

//                 return Column(
//                   children: [
//                     ListTile(
//                       title: Text(post.title),
//                       subtitle: Text(
//                         'Probability: ${postProbability.toStringAsFixed(2)}',
//                       ),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: ClampingScrollPhysics(),
//                       itemCount: filteredComments.length > 10
//                           ? 10
//                           : filteredComments.length,
//                       itemBuilder: (context, commentIndex) {
//                         final comment = filteredComments[commentIndex];
//                         final commentProbability =
//                             _getCommentProbability(comment);

//                         if (displayedTexts.contains(comment.body)) {
//                           return Container(); // Skip duplicate text
//                         }

//                         displayedTexts
//                             .add(comment.body); // Add displayed text to set

//                         return ListTile(
//                           title: Text(comment.body),
//                           subtitle: Text(
//                             'Probability: ${commentProbability.toStringAsFixed(2)}',
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 32.0),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.5,
//             height: 48.0,
//             child: ElevatedButton(
//               onPressed: () {
//                 Coordinator.of(context).push(RouteEntity.homeScreen());
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colour.hunterGreen,
//               ),
//               child: Text(
//                 'Search again',
//                 style: TextStyles.body(color: Colour.white),
//               ),
//             ),
//           ),
//           SizedBox(height: 32.0),
//         ],
//       ),
//     );
//   }

//   double _getPostProbability(RedditPost post) {
//     switch (widget.category) {
//       case 'hateSpeech':
//         return post.probabilityHateSpeech ?? 0;
//       case 'sarcasmExcluding':
//         return post.probabilitySarcasmExcluding ?? 0;
//       case 'sarcasmIncluding':
//         return post.probabilitySarcasmIncluding ?? 0;
//       case 'positiveContent':
//         return post.probabilityPositiveContent ?? 0;
//       case 'humor':
//         return post.probabilityHumor ?? 0;
//       default:
//         return 0;
//     }
//   }

//   double _getCommentProbability(RedditComment comment) {
//     switch (widget.category) {
//       case 'hateSpeech':
//         return comment.probabilityHateSpeech ?? 0;
//       case 'sarcasmExcluding':
//         return comment.probabilitySarcasmExcluding ?? 0;
//       case 'sarcasmIncluding':
//         return comment.probabilitySarcasmIncluding ?? 0;
//       case 'positiveContent':
//         return comment.probabilityPositiveContent ?? 0;
//       case 'humor':
//         return comment.probabilityHumor ?? 0;
//       default:
//         return 0;
//     }
//   }

//   String _getCategoryName(String category) {
//     if (category == 'hateSpeech') {
//       return 'Hate Speech';
//     } else if (category == 'sarcasmExcluding')
//       return 'Excluding Sarcasm';
//     else if (category == 'humor')
//       return 'Humor';
//     else if (category == 'positiveContent')
//       return 'Positive Content';
//     else if (category == 'sarcasmIncluding') {
//       return 'Including Sarcasm';
//     } else {
//       return '';
//     }
//   }
// }
// -----------

import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/text_style.dart';
import 'package:filter101/coordinator.dart';
import 'package:filter101/data/comment.dart';
import 'package:filter101/data/post.dart';
import 'package:filter101/routes.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String category;
  final List<RedditPost> posts;
  final List<RedditComment> comments;

  const CategoryDetailsScreen({
    required this.category,
    required this.posts,
    required this.comments,
  });

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  Set<String> displayedTexts = {}; // Set to track displayed texts

  @override
  Widget build(BuildContext context) {
    // Filter posts and comments with non-zero probability
    final filteredPosts = widget.posts.where((post) {
      var postProbability = _getPostProbability(post);
      return postProbability != 0.00;
    }).toList();

    final filteredComments = widget.comments.where((comment) {
      var commentProbability = _getCommentProbability(comment);
      return commentProbability != 0.00;
    }).toList();

    // Sort posts and comments in descending order based on probability
    filteredPosts.sort((a, b) {
      var aProbability = _getPostProbability(a);
      var bProbability = _getPostProbability(b);
      return bProbability.compareTo(aProbability);
    });

    filteredComments.sort((a, b) {
      var aProbability = _getCommentProbability(a);
      var bProbability = _getCommentProbability(b);
      return bProbability.compareTo(aProbability);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getCategoryName(widget.category),
          style: TextStyles.heading(
            color: Colour.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colour.hunterGreen,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredPosts.length,
          //     itemBuilder: (context, index) {
          //       final post = filteredPosts[index];
          //       final postProbability = _getPostProbability(post);

          //       return Card(
          //         margin: EdgeInsets.symmetric(
          //           horizontal: 16.0,
          //           vertical: 8.0,
          //         ),
          //         elevation: 2.0,
          //         child: ListTile(
          //           title: Text(post.title),
          //           subtitle: Text(
          //             'Probability: ${postProbability.toStringAsFixed(2)}',
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          SizedBox(height: 32.0),
          Expanded(
            child: ListView.builder(
              itemCount:
                  filteredComments.length > 10 ? 10 : filteredComments.length,
              itemBuilder: (context, commentIndex) {
                final comment = filteredComments[commentIndex];
                final commentProbability = _getCommentProbability(comment);

                if (displayedTexts.contains(comment.body)) {
                  return Container(); // Skip duplicate text
                }

                displayedTexts.add(comment.body); // Add displayed text to set

                return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  elevation: 2.0,
                  child: ListTile(
                    title: Text(comment.body),
                    subtitle: Text(
                      'Probability: ${commentProbability.toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 32.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 48.0,
            child: ElevatedButton(
              onPressed: () {
                Coordinator.of(context).push(RouteEntity.homeScreen());
              },
              style: ElevatedButton.styleFrom(
                primary: Colour.hunterGreen,
              ),
              child: Text(
                'Search again',
                style: TextStyles.body(color: Colour.white),
              ),
            ),
          ),
          SizedBox(height: 32.0),
        ],
      ),
    );
  }

  double _getPostProbability(RedditPost post) {
    switch (widget.category) {
      case 'hateSpeech':
        return post.probabilityHateSpeech ?? 0;
      case 'sarcasmExcluding':
        return post.probabilitySarcasmExcluding ?? 0;
      case 'sarcasmIncluding':
        return post.probabilitySarcasmIncluding ?? 0;
      case 'positiveContent':
        return post.probabilityPositiveContent ?? 0;
      case 'humor':
        return post.probabilityHumor ?? 0;
      default:
        return 0;
    }
  }

  double _getCommentProbability(RedditComment comment) {
    switch (widget.category) {
      case 'hateSpeech':
        return comment.probabilityHateSpeech ?? 0;
      case 'sarcasmExcluding':
        return comment.probabilitySarcasmExcluding ?? 0;
      case 'sarcasmIncluding':
        return comment.probabilitySarcasmIncluding ?? 0;
      case 'positiveContent':
        return comment.probabilityPositiveContent ?? 0;
      case 'humor':
        return comment.probabilityHumor ?? 0;
      default:
        return 0;
    }
  }

  String _getCategoryName(String category) {
    if (category == 'hateSpeech') {
      return 'Hate Speech';
    } else if (category == 'sarcasmExcluding')
      return 'Excluding Sarcasm';
    else if (category == 'humor')
      return 'Humor';
    else if (category == 'positiveContent')
      return 'Positive Content';
    else if (category == 'sarcasmIncluding') {
      return 'Including Sarcasm';
    } else {
      return '';
    }
  }
}
