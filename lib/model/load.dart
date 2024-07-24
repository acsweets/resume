import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resume/model/resume.dart';

/// Author:      星星
/// CreateTime:  2024/7/24
/// Contact Me:  1395723441@qq.com

class Load {
  static final Load _instance = Load._();
  static Resume? resumeData;

  static Load get instance => _instance;

  Load._();

  Future<void> init() async {
    resumeData = await loadData();
  }

  Future<Resume> loadData() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final Map<String, dynamic> jsonMap = json.decode(response);
    return Resume.fromMap(jsonMap);
  }
}
