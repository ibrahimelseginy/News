import 'package:news/news/data/data_souce/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsRepository {
  final NewsdataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<News>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}
