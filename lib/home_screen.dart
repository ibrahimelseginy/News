import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_grid.dart';
import 'package:news/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: const HomeDrawer(),
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: const CategoryGrid(),
      ),
    );
  }
}
