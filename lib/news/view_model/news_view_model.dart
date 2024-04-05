import 'package:flutter/material.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repository/news_repository.dart';
import 'package:news/shared/service_locator.dart';
// import 'package:news/news/data/data_souce/news_api_data_source.dart';

class NewsViewModel with ChangeNotifier {
  // final NewsApiDataSource apiDataSource = NewsApiDataSource();
  late final NewsRepository repository;
  NewsViewModel() {
    repository = NewsRepository(
      ServiceLocator.newsdataSource,
    );
  }

  List<News> newsList = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
