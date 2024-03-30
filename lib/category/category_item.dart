import 'package:flutter/material.dart';
import 'package:news/category/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(index.isEven ? 20 : 0),
          bottomRight: Radius.circular(index.isOdd ? 20 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            category.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
