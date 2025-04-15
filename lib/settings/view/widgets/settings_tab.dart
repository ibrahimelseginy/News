import 'package:flutter/material.dart';
import 'package:news/settings/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class Language {
  String name;
  String code;

  Language({
    required this.name,
    required this.code,
  });
}

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settingsTab';
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.22,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    value: languages.firstWhere(
                      (lang) => lang.code == settingsProvider.languegeCode,
                    ),
                    items: languages
                        .map(
                          (language) => DropdownMenuItem<Language>(
                            value: language,
                            child: Text(
                              language.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingsProvider.chaneLanguage(selectedLanguage.code);
                      }
                    },
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
