import 'package:flutter/material.dart';
import 'package:news/category/view/widgets/category_item.dart';
import 'package:news/category/data/models/category_model.dart';

class CategoryGrid extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelected;
  const CategoryGrid({required this.onCategorySelected, super.key});

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
              itemBuilder: (_, index) {
                final category = CategoryModel.categories[index];
                return InkWell(
                  onTap: () {
                    onCategorySelected(category);
                  },
                  child: CategoryItem(
                    category: category,
                    index: index,
                  ),
                );
              },
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
