import 'dart:convert';
import 'package:news/news/data/data_souce/news_data_source.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource extends NewsdataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
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
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      throw Exception(
        'failed to get Sources',
      );
    }
  }
}
