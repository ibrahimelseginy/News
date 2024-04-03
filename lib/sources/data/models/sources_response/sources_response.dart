import 'source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;

  SourcesResponse({this.status, this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
