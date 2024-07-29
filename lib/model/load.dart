import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resume/model/resume.dart';

/// Author:      星星
/// CreateTime:  2024/7/24
/// Contact Me:  1395723441@qq.com

class Load {
  static final Load _instance = Load._();
  static Resume? resumeDataZh;
  static Resume? resumeDataEn;

  late final String responseZh;
  late final String responseEn;
  static late final Map<String, dynamic> jsonMapZh;
  static late final Map<String, dynamic> jsonMapEn;

  static Load get instance => _instance;

  Load._();

  Future<void> init() async {
    responseZh = await rootBundle.loadString('assets/data/data_zh.json');
    responseEn = await rootBundle.loadString('assets/data/data_en.json');
    jsonMapZh = json.decode(responseZh);
    jsonMapEn = json.decode(responseEn);
    loadData();

  }

  void loadData() {
      resumeDataZh=  Resume.fromMap(jsonMapZh);
      resumeDataEn=  Resume.fromMap(jsonMapEn);

    }
}
