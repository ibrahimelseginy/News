import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/sources_response/source.dart';

class TabItem extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const TabItem({
    required this.source,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor,
        ),
      ),
    );
  }
}
