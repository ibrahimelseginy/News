import 'dart:ui';

class CategoryModel {
  final String id;
  final String title;
  final String imageName;
  final Color color;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.imageName,
    required this.color,
  });
  static List<CategoryModel> categories = [
    const CategoryModel(
      id: 'business',
      title: 'Business',
      imageName: 'bussines',
      color: Color(0xffCF7E48),
    ),
    const CategoryModel(
      id: 'health',
      title: 'Health',
      imageName: 'health',
      color: Color(0xffED1E79),
    ),
    const CategoryModel(
      id: 'science',
      title: 'Science',
      imageName: 'science',
      color: Color(0xffF2D352),
    ),
    const CategoryModel(
      id: 'sports',
      title: 'Sports',
      imageName: 'ball',
      color: Color(0xffC91C22),
    ),
  ];
}
