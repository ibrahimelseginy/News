import 'package:news/news/data/models/news.dart';

import 'news_data_source.dart';

class SourcesFirebaseDataSource extends NewsdataSource {
  @override
  Future<List<News>> getNews(String sourceId) async {
    // firebase logic
    return <News>[];
  }
}
