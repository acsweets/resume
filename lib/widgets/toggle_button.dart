import 'package:flutter/material.dart';

import '../local/language.dart';
import '../model/load.dart';

/// Author:      星星
/// CreateTime:  2024/7/24
/// Contact Me:  1395723441@qq.com

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageInherited = LanguageInheritedWidget.of(context);
    final isEnglish = languageInherited.locale.languageCode == 'en';
    return ElevatedButton(
      onPressed: () {
        languageInherited.changeLanguage(isEnglish ? const Locale('zh', '') : const Locale('en', ''));
      },
      child: Text(isEnglish ? '中文' : ' English'),
    );
  }
}
