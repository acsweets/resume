import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume/resume/resume_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';
/// Author:      星星
/// CreateTime:  2024/7/18
/// Contact Me:  1395723441@qq.com


class MyResume extends StatelessWidget {
  const MyResume({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // 英语
        Locale('zh', ''), // 中文
        // 添加其他支持的语言
      ],
      debugShowCheckedModeBanner:false,
      title: '衿璃',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ScreenUtilInit (designSize : const Size(1920, 1080),  builder:(_, child) {
        return  const ResumePage();
      }),
    );
  }
}
