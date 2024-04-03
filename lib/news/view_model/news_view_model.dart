import 'package:flutter/material.dart';
import 'package:news/news/data/data_souce/news_api_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  final NewsApiDataSource apiDataSource = NewsApiDataSource();
  String? errorMessage;
  bool isLoading = false;

  List<News> newsList = [];

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getNews(sourceId);
      if (response.status == 'ok') {
        newsList = response.news ?? [];
      } else {
        errorMessage = 'failed to get Sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
