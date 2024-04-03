import 'package:flutter/material.dart';
import 'package:news/news/data/models/source.dart';
import 'package:news/sources/data/data_source/sources_api_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesApiDataSource apiDataSource = SourcesApiDataSource();
  List<Source> sources = [];
  bool isLoading = false;
  // bool hasError = false;
  String? errorMessage;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await apiDataSource.getSources(categoryId);
      if (response.status == 'ok') {
        sources = response.sources?.cast<Source>() ?? [];
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
