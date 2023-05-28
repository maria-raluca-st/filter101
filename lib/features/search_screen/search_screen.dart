// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'search_bloc.dart';

// class SearchScreen extends StatelessWidget {
//   final SearchBloc searchBloc;

//   const SearchScreen({required this.searchBloc});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Search',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: BlocBuilder<SearchBloc, SearchState>(
//         bloc: searchBloc,
//         builder: (context, state) {
//           if (state is SearchLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is SearchLoadedState) {
//             final probabilities = state.probabilities;
//             final posts = state.posts;

//             return Column(
//               children: [
//                 Column(
//                   children: [
//                     if (probabilities.containsKey('hateSpeechProbability'))
//                       Text(
//                         'Hate Speech Score: ${probabilities['hateSpeechProbability']!.toStringAsFixed(2)}',
//                         style: TextStyle(color: Colors.black),
//                         textAlign: TextAlign.center,
//                       ),
//                     // Display scores for other categories here

//                     SizedBox(height: 20),
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: posts.length,
//                     itemBuilder: (context, index) {
//                       final post = posts[index];
//                       return ListTile(
//                         title: Text(post.title),
//                         subtitle: Text(post.subreddit),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           } else if (state is SearchErrorState) {
//             return Center(
//               child: Text(
//                 'An error occurred while fetching data.',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
// // -----------------------------------
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // import 'search_bloc.dart';

// // class SearchScreen extends StatelessWidget {
// //   final SearchBloc searchBloc;

// //   const SearchScreen({required this.searchBloc});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Search'),
// //       ),
// //       body: BlocBuilder<SearchBloc, SearchState>(
// //         builder: (context, state) {
// //           if (state is SearchLoadingState) {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else if (state is SearchLoadedState) {
// //             return ListView(
// //               children: state.probabilities.entries.map((entry) {
// //                 if (context
// //                     .watch<SearchBloc>()
// //                     .selectedCategories[entry.key]!) {
// //                   return ListTile(
// //                     title: Text(entry.key),
// //                     subtitle:
// //                         Text('Probability: ${entry.value.toStringAsFixed(2)}'),
// //                   );
// //                 } else {
// //                   return Container();
// //                 }
// //               }).toList(),
// //             );
// //           } else if (state is SearchErrorState) {
// //             return Center(
// //               child: Text('Error occurred while fetching data.'),
// //             );
// //           } else {
// //             return Container();
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// -----------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_bloc.dart';

class SearchScreen extends StatelessWidget {
  final SearchBloc searchBloc;

  const SearchScreen({required this.searchBloc});

  @override
  Widget build(BuildContext context) {
    // Print category boolean values
    print('Hate Speech: ${searchBloc.selectedCategories['hateSpeech']}');
    print(
        'Negative Content: ${searchBloc.selectedCategories['negativeContent']}');
    print(
        'Sarcasm excluding: ${searchBloc.selectedCategories['sarcasmExcluding']}');
    print(
        'Sarcasm Including: ${searchBloc.selectedCategories['sarcasmIncluding']}');
    print('Subreddit Name: ${searchBloc.subredditName}');
    // Print scores for other categories here

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        bloc: this.searchBloc,
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchLoadedState) {
            final probabilities = state.probabilities;
            final posts = state.posts;

            // Print obtained probabilities
            print(
                'Hate Speech Score: ${probabilities!['hateSpeechProbability']!.toStringAsFixed(2)}');
            // Print scores for other categories here

            return Column(
              children: [
                Column(
                  children: [
                    if (probabilities!.containsKey('hateSpeechProbability'))
                      Text(
                        'Hate Speech Score: ${probabilities['hateSpeechProbability']!.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    // Display scores for other categories here

                    SizedBox(height: 20),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts!.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.subreddit),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text(
                'An error occurred while fetching data.',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
