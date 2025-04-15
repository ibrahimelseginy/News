import 'package:news/news/data/data_souce/news_api_data_source.dart';
import 'package:news/news/data/data_souce/news_data_source.dart';
import 'package:news/sources/data/repository/sources_data_source.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';
// import 'package:news/sources/data/data_source/sources_firebase_data_source.dart';

class ServiceLocator {
  static SourcesDateSource sourcesDateSource = SourcesApiDataSource();
  // static SourcesDateSource sourcesDateSource = SourcesFirebaseDataSource();

  static NewsdataSource newsdataSource = NewsApiDataSource();
}
