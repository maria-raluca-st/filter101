import 'dart:convert';
import '../data/comment.dart';
import '../data/post.dart';
import 'package:http/http.dart' as http;

class RedditService {
  static Future<List<RedditPost>> fetchPosts(String subreddit,
      {int limit = 25}) async {
    final response = await http.get(
        Uri.parse('https://www.reddit.com/r/$subreddit.json?limit=$limit'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jsonList = jsonData['data']['children'];

      List<RedditPost> posts = jsonList.map<RedditPost>((json) {
        final postData = json['data'];
        return RedditPost.fromJson(postData);
      }).toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  static Future<List<RedditComment>> fetchComments(String permalink) async {
    final response =
        await http.get(Uri.parse('https://www.reddit.com$permalink.json'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body)[1]['data']['children'];
      return jsonList.map((json) => RedditComment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch comments');
    }
  }
}
