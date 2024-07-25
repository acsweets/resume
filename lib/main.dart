import 'package:flutter/material.dart';
import 'package:resume/model/load.dart';
import 'package:resume/resume/my_web.dart';
import 'local/language_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Load.instance.init();
   runApp(const LanguageProvider(child: MyWeb()));
}







