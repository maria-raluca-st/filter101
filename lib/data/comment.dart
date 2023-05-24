class RedditComment {
  final String body;

  RedditComment({required this.body});

  factory RedditComment.fromJson(Map<String, dynamic> json) {
    return RedditComment(
      body: json['body'],
    );
  }
}
