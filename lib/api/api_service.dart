import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String catogoryId) async {
    //Api call
    try {
      final uri =
          Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndpoint, {
        'apiKey': ApiConstants.apiKey,
        'catogory': catogoryId,
      });
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return SourcesResponse.fromJson(json);
    } catch (error) {
      print(error);
      rethrow; // throw error;
    }
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    try {
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
    } catch (error) {
      print(error);
      rethrow; // throw error;
    }
  }
}
