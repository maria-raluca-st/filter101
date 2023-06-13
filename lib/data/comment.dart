class RedditComment {
  final String body;
  double? probabilityHateSpeech;
  double? probabilitySarcasmExcluding;
  double? probabilitySarcasmIncluding;
  double? probabilityPositiveContent;
  double? probabilityHumor;

  RedditComment({
    required this.body,
    this.probabilityHateSpeech = 0.0,
    this.probabilitySarcasmExcluding = 0.0,
    this.probabilitySarcasmIncluding = 0.0,
    this.probabilityPositiveContent = 0.0,
    this.probabilityHumor = 0.0,
  });

  factory RedditComment.fromJson(Map<String, dynamic> json) {
    return RedditComment(
      body: json['body'],
    );
  }
}
