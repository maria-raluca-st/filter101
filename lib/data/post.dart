// class RedditPost {
//   final String title;
//   final String selftext;

//   RedditPost({required this.title, required this.selftext});

//   factory RedditPost.fromJson(Map<String, dynamic> json) {
//     return RedditPost(
//       title: json['data']['title'],
//       selftext: json['data']['selftext'],
//     );
//   }
// }

class RedditPost {
  final String id;
  final String title;
  final String selftext;
  final List<String> comments;
  final String subreddit;

  RedditPost({
    required this.subreddit,
    required this.id,
    required this.title,
    required this.selftext,
    required this.comments,
  });

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    final commentsList = json['comments'] != null
        ? List<String>.from(json['comments'])
        : <String>[];

    return RedditPost(
      id: json['id'] as String,
      title: json['title'] ?? '',
      selftext: json['selftext'] ?? '',
      subreddit: json['subreddit'] as String,
      comments: commentsList,
    );
  }
}
