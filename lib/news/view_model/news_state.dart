import 'package:news/news/data/models/news.dart';

// create class express to type states
abstract class NewsState {}

// create concreate classes extends from abstract class
class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  final List<News> newsList;
  GetNewsSuccess(this.newsList);
}

class GetNewsError extends NewsState {
  final String message;
  GetNewsError(this.message);
}
