// import 'dart:convert';
// import '../data/comment.dart';
// import '../data/post.dart';
// import 'package:http/http.dart' as http;

// class RedditService {
//   static Future<List<RedditPost>> fetchPosts(String subreddit) async {
//     final response =
//         await http.get(Uri.parse('https://www.reddit.com/r/$subreddit.json'));

//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final jsonList = jsonData['data']['children'];

//       List<RedditPost> posts = jsonList.map<RedditPost>((json) {
//         final postData = json['data'];
//         return RedditPost.fromJson(postData);
//       }).toList();

//       return posts;
//     } else {
//       throw Exception('Failed to fetch posts');
//     }
//   }

//   static Future<List<RedditComment>> fetchComments(String permalink) async {
//     final response =
//         await http.get(Uri.parse('https://www.reddit.com$permalink.json'));
//     if (response.statusCode == 200) {
//       final jsonList = json.decode(response.body)[1]['data']['children'];
//       return jsonList.map((json) => RedditComment.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch comments');
//     }
//   }
// }

// --------------------------------
import 'dart:convert';
import 'dart:io';

import 'package:http/io_client.dart';

import '../data/comment.dart';
import '../data/post.dart';

class RedditService {
  static Future<List<RedditPost>> fetchPosts(
      String subreddit, int limit) async {
    try {
      final url = Uri.parse('https://www.reddit.com/r/$subreddit.json');
      final client = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;
      final ioClient = IOClient(client);

      List<RedditPost> posts = [];
      String? after;

      while (posts.length < limit) {
        try {
          final response = await ioClient.get(
            url.replace(queryParameters: {'limit': '100', 'after': after}),
          );

          if (response.statusCode == 200) {
            final jsonData = json.decode(response.body);
            final jsonList = jsonData['data']['children'];

            List<RedditPost> fetchedPosts = jsonList.map<RedditPost>((json) {
              final postData = json['data'];
              return RedditPost.fromJson(postData);
            }).toList();

            posts.addAll(fetchedPosts);

            if (jsonList.isNotEmpty) {
              after = jsonData['data']['after'];
            } else {
              break;
            }
          } else {
            throw Exception('Failed to fetch posts: ${response.statusCode}');
          }
        } on SocketException {
          throw Exception('Failed to connect to the host');
        }
      }

      if (posts.length > limit) {
        posts = posts.sublist(0, limit);
      }

      return posts;
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }

  static Future<List<RedditComment>> fetchComments(
      String permalink, int limit) async {
    try {
      final url = Uri.parse('https://www.reddit.com$permalink.json');
      final client = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;
      final ioClient = IOClient(client);

      List<RedditComment> comments = [];
      String? after;

      while (comments.length < limit) {
        try {
          final response = await ioClient.get(
            url.replace(queryParameters: {'limit': '100', 'after': after}),
          );

          if (response.statusCode == 200) {
            final jsonList = json.decode(response.body)[1]['data']['children'];

            List<RedditComment> fetchedComments = jsonList
                .map<RedditComment>((json) => RedditComment.fromJson(json))
                .toList();

            comments.addAll(fetchedComments);

            if (jsonList.isNotEmpty) {
              after = jsonList.last['data']['name'];
            } else {
              break;
            }
          } else {
            throw Exception('Failed to fetch comments: ${response.statusCode}');
          }
        } on SocketException {
          throw Exception('Failed to connect to the host');
        }
      }

      if (comments.length > limit) {
        comments = comments.sublist(0, limit);
      }

      return comments;
    } catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }
}
