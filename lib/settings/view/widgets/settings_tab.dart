import 'package:flutter/material.dart';
import 'package:news/settings/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'Settings';
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [])
        ],
      ),
    );
  }
}
