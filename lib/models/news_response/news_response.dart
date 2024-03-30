import 'news.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? news;

  NewsResponse({
    this.status,
    this.totalResults,
    this.news,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
