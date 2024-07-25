import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';
import '../local/language.dart';
import 'home_page.dart';

/// Author:      星星
/// CreateTime:  2024/7/18
/// Contact Me:  1395723441@qq.com

class MyWeb extends StatelessWidget {
  const MyWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final languageInherited = LanguageInheritedWidget.of(context);
    return MaterialApp(
      locale: languageInherited.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: '衿璃',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
          designSize: const Size(1920, 1080),
          builder: (_, child) {
            return const HomePage();
          }),
    );
  }
}
