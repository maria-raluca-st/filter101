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
      title: json['title'],
      subreddit: json['subreddit'],
      permalink: json['permalink'],
      selfText: json['selftext'],
    );
  }
  @override
  String toString() {
    return 'RedditPost(title: $title, subreddit: $subreddit, permalink: $permalink, selfText: $selfText)';
  }
}
