import 'dart:convert';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
