import 'package:news/news/data/models/news.dart';

// create contract class
abstract class NewsdataSource {
  Future<List<News>> getNews(String sourceId);
}
