import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/repository/news_repository.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepository(
      ServiceLocator.newsdataSource,
    );
  }
  late final NewsRepository repository;
  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(sourceId);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}


/*
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
*/