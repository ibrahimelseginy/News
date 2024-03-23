import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String catogoryId) async {
    //Api call
    try {
      final uri = Uri.https('newsapi.org', '/v2/top-headlines/sources', {
        'apiKey': '258155f6d5044eb09138cf2a8478c733',
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
}
