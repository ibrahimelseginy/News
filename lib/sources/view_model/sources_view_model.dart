import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/repository/sources_repository.dart';
import 'package:news/sources/view_model/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  SourcesViewModel() : super(SourcesInitial()) {
    repository = SourcesRepository(
      ServiceLocator.sourcesDateSource,
    );
  }
  late final SourcesRepository repository;
  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}


/*
import 'package:flutter/material.dart';
import 'package:news/news/data/models/source.dart';
import 'package:news/shared/service_locator.dart';
import 'package:news/sources/data/repository/sources_repository.dart';

// import 'package:news/sources/data/data_source/sources_api_data_source.dart';
// import 'package:news/sources/data/data_source/sources_firebase_data_source.dart';
// import 'package:news/sources/data/repository/sources_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  late final SourcesRepository repository;

  SourcesViewModel() {
    repository = SourcesRepository(
      ServiceLocator.sourcesDateSource,
    );
    // final SourcesDateSource dataSource ;
    // final SourcesDateSource dataSource = SourcesFirebaseDataSource();
    // final SourcesDateSource dataSource = SourcesApiDataSource();
  }

  // bool hasError = false;
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}*/
