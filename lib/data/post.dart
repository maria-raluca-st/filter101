import 'package:filter101/data/comment.dart';

class RedditPost {
  final String title;
  final String subreddit;
  final String permalink;
  final String selfText;
  List<RedditComment> comments;

  RedditPost({
    required this.title,
    required this.subreddit,
    required this.permalink,
    required this.selfText,
    this.comments = const [],
  });

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    return RedditPost(
      title: json['data']['title'],
      subreddit: json['data']['subreddit'],
      permalink: json['data']['permalink'],
      selfText: json['data']['selftext'],
    );
  }
}
