/// Author:      星星
/// CreateTime:  2024/7/24
/// Contact Me:  1395723441@qq.com


import 'package:flutter/material.dart';

class LanguageInheritedWidget extends InheritedWidget {
  final Locale locale;
  final Function(Locale) changeLanguage;

  const LanguageInheritedWidget({
    super.key,
    required this.locale,
    required this.changeLanguage,
    required super.child,
  });

  static LanguageInheritedWidget of(BuildContext context) {
    final LanguageInheritedWidget? result =
    context.dependOnInheritedWidgetOfExactType<LanguageInheritedWidget>();
    assert(result != null, 'No LanguageInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LanguageInheritedWidget oldWidget) {
    return locale != oldWidget.locale;
  }
}