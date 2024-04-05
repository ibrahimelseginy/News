import 'package:news/news/data/models/source.dart';
import 'package:news/sources/data/repository/sources_data_source.dart';

class SourcesFirebaseDataSource extends SourcesDateSource {
  @override
  Future<List<Source>> getSources(categoryId) async {
    // firebase logic
    return <Source>[];
  }
}
