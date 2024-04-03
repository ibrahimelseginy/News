import 'dart:convert';
import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/models/sources_response/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesApiDataSource {
  //Api call
  Future<SourcesResponse> getSources(String catogoryId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'catogory': catogoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
