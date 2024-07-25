import 'package:flutter/material.dart';

import 'language.dart';

/// Author:      星星
/// CreateTime:  2024/7/24
/// Contact Me:  1395723441@qq.com


class LanguageProvider extends StatefulWidget {
  final Widget child;

  const LanguageProvider({super.key, required this.child});

  @override
   createState() => _LanguageProviderState();
}

class _LanguageProviderState extends State<LanguageProvider> {
  Locale _locale = const Locale('zh', '');

  void changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LanguageInheritedWidget(
      locale: _locale,
      changeLanguage: changeLanguage,
      child: widget.child,
    );
  }
}