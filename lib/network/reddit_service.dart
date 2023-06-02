import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../data/comment.dart';
import '../data/post.dart';

class RedditService {
  static Future<List<RedditPost>> fetchPosts(String subreddit) async {
    try {
      final url = Uri.parse('https://www.reddit.com/r/$subreddit.json');
      final response = await http.get(url);
      List<RedditPost> posts = [];

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData != null &&
            jsonData['data'] != null &&
            jsonData['data']['children'] != null) {
          final jsonList = jsonData['data']['children'];

          for (var json in jsonList) {
            try {
              final postData = json['data'];
              print('Data: $postData');
              final title = postData['title'];
              final selfText = postData['selftext'];
              final permalink = postData['permalink'];

              if ((title != null || selfText != null) && permalink != null) {
                print(postData);
                posts.add(RedditPost.fromJson(postData));
              }
            } catch (e) {
              print('Skipping post due to incomplete data: $e');
            }
          }

          print(
              '-------------------------------------------------------------');
          print(posts);
          return posts;
        }
      } else {
        throw Exception('Failed to fetch posts: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Failed to connect to the host');
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
    return [];
  }

  static Future<List<RedditComment>> fetchComments(String permalink) async {
    try {
      final url = Uri.parse('https://www.reddit.com$permalink.json');
      final response = await http.get(url);
      List<RedditComment> comments = [];

      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body)[1]['data']['children'];

        for (var json in jsonList) {
          try {
            final commentData = json['data'];
            final comment = RedditComment.fromJson(commentData);
            comments.add(comment);
          } catch (e) {
            print('Skipping comment due to incomplete data: $e');
          }
        }
        return comments;
      } else {
        throw Exception('Failed to fetch comments: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Failed to connect to the host');
    } catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }
}
