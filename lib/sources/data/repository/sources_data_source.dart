// Absruction
// create contract => data source الحاجه  الاساسية اللي هنتفق عليها في اي

import 'package:news/news/data/models/source.dart';

abstract class SourcesDateSource {
  Future<List<Source>> getSources(categoryId);
}
