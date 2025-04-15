import 'dart:convert';
import 'package:news/news/data/models/source.dart';
import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/models/sources_response/sources_response.dart';
import 'package:http/http.dart' as http;
import 'package:news/sources/data/repository/sources_data_source.dart';

// concreate Implementation (details)
//Api call
class SourcesApiDataSource extends SourcesDateSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'catogory': categoryId,
      },
    );
    //merged codeApi with SourcesDateSource
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources?.cast<Source>() ?? [];
    } else {
      throw Exception(
        'Faild to get sources',
      );
    }
  }
}
