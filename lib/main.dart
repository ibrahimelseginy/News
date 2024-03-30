import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home_screen.dart';
import 'package:news/settings/settings_tab.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsTab.routeName: (_) => const SettingsTab(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
