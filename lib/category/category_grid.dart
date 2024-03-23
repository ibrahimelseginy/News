import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/category/category_item.dart';
import 'package:news/category/category_model.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Text(
              'Pick your category of interest',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (_, index) => CategoryItem(
                category: CategoryModel.categories[index],
                index: index,
              ),
              itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
