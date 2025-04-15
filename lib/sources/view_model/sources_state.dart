import 'package:news/sources/data/models/sources_response/source.dart';

// create class express to type states
abstract class SourcesState {}

// create concreate classes extends from abstract class
class SourcesInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  final List<Source> sources;
  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  final String message;
  GetSourcesError(this.message);
}
