import 'package:news/news/data/models/source.dart';
import 'package:news/sources/data/repository/sources_data_source.dart';
// import 'package:news/sources/data/data_source/sources_api_data_source.dart';
// import 'package:news/sources/data/data_source/sources_firebase_data_source.dart';

class SourcesRepository {
  final SourcesDateSource dataSource;
  SourcesRepository(this.dataSource);
  // final SourcesDateSource dataSource = SourcesFirebaseDataSource();
  // final SourcesDateSource dataSource = SourcesApiDataSource();

  Future<List<Source>> getSources(String catogoryId) async {
    return dataSource.getSources(catogoryId);
  }
}
