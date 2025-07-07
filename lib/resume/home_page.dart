/// Author:      星星
/// CreateTime:  2024/7/18
/// Contact Me:  1395723441@qq.com

import 'dart:convert';
import 'dart:ui';
import 'dart:typed_data' as typed;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:resume/resume/resume_page.dart';
import 'package:universal_html/html.dart' as html;
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../generated/l10n.dart';
import '../local/language.dart';
import '../model/load.dart';
import '../model/resume.dart';
import '../widgets/toggle_button.dart';

final GlobalKey pdfKey = GlobalKey();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Widget mainWidget = RepaintBoundary(key: pdfKey, child:  const ResumePage());
  Color homeBgColor = const Color(0xfff0f1f3);
  late Widget sloganWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Widget home;
        if (constraints.maxWidth < 600) {
          sloganWidget = Text(S.of(context).slogan, style: TextStyle(color: Theme.of(context).primaryColor));
          home = mainWidget;
        } else if (constraints.maxWidth < 1200) {
          home = Row(
            children: [
              Expanded(
                  child: Container(
                color: homeBgColor,
              )),
              SizedBox(
                width: 600,
                child: mainWidget,
              ),
              Expanded(
                  child: Container(
                color: homeBgColor,
              )),
            ],
          );
          sloganWidget = Text(S.of(context).slogan1, style: TextStyle(color: Theme.of(context).primaryColor));
        } else {
          sloganWidget = Text(S.of(context).slogan2, style: TextStyle(color: Theme.of(context).primaryColor));

          home = Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(color: homeBgColor),
              ),
              Flexible(
                flex: 4,
                child: mainWidget,
              ),
              Flexible(
                flex: 2,
                child: Container(color: homeBgColor),
              ),
            ],
          );
        }

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0, right: 15),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                Expanded(child: sloganWidget),
                const LanguageToggleButton(),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      compute(captureAndSavePng, null);
                    },
                    child: Text(
                      S.of(context).generatePDF,
                      style: const TextStyle(fontSize: 14),
                    )),
              ],
            ),
          ),

          body: home,
        );
      },
    );
  }

  Future<void> createPDF(typed.Uint8List pngBytes) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          final pdfImage = pw.MemoryImage(pngBytes);
          // return pw.Center(
          //   child: pw.Text('Hello World'),
          // );
          return pw.Center(
            child: pw.Image(pdfImage),
          );
        },
      ),
    );
    // 将 PDF 转换为字节数据
    final bytes = await pdf.save();
    // 创建 Blob
    final blob = html.Blob([bytes], 'application/pdf');
    // 创建下载链接
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'resume.pdf';
    html.document.body?.children.add(anchor);
    // 触发下载
    anchor.click();
    // 清理
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> captureAndSavePng(dynamic _) async {
    try {
      // 等待一帧绘制完成
      await Future.delayed(const Duration(milliseconds: 20));
      RenderRepaintBoundary boundary = pdfKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      typed.ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      typed.Uint8List pngBytes = byteData!.buffer.asUint8List();
      createPDF(pngBytes);
    } catch (e) {
      print(e);
    }
  }
  Widget _oneself() {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("衿璃 衿璃 青青子衿，悠悠我心。锦鲤 锦鲤"),
            ],
          )
        ],
      ),
    );}
}
