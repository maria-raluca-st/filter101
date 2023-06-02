import 'package:filter101/data/post.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String category;
  final List<RedditPost> posts;

  const CategoryDetailsScreen({required this.category, required this.posts});

  @override
  Widget build(BuildContext context) {
    // Sort the posts based on probabilities in descending order

    if (category == 'hateSpeech') {
      posts.sort((a, b) => (b.probabilityHateSpeech ?? 0)
          .compareTo(a.probabilityHateSpeech ?? 0));
    } else if (category == 'sarcasmExcluding') {
      posts.sort((a, b) => (b.probabilitySarcasmExcluding ?? 0)
          .compareTo(a.probabilitySarcasmExcluding ?? 0));
    } else if (category == 'sarcasmIncluding') {
      posts.sort((a, b) => (b.probabilitySarcasmIncluding ?? 0)
          .compareTo(a.probabilitySarcasmIncluding ?? 0));
    } else if (category == 'positiveContent') {
      posts.sort((a, b) => (b.probabilityPositiveContent ?? 0)
          .compareTo(a.probabilityPositiveContent ?? 0));
    } else if (category == 'humor') {
      posts.sort((a, b) =>
          (b.probabilityHumor ?? 0).compareTo(a.probabilityHumor ?? 0));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details: $category'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          var probability;
          if (category == 'hateSpeech') {
            probability = post.probabilityHateSpeech;
          } else if (category == 'sarcasmExcluding') {
            probability = post.probabilitySarcasmExcluding;
          } else if (category == 'sarcasmIncluding') {
            probability = post.probabilitySarcasmIncluding;
          } else if (category == 'positiveContent') {
            probability = post.probabilityPositiveContent;
          } else if (category == 'humor') {
            probability = post.probabilityHumor;
          }
          return ListTile(
            title: Text(post.title),
            subtitle: Text('Probability: ${probability.toStringAsFixed(2)}'),
            // Add more details or customize the list tile as needed
          );
        },
      ),
    );
  }
}
