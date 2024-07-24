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
import 'package:universal_html/html.dart' as html;
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../generated/l10n.dart';
import '../model/resume.dart';
import '../widgets/tag.dart';
import 'package:resume/model/load.dart';

import '../widgets/toggle_button.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  //创建一个 GlobalKey 来引用你想要捕获的 Widget

  //RepaintBoundary(
  //         key: _globalKey,
  //         child: YourWidget(),  // 这里是你想要捕获的 Widget
  //       ),

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // if (constraints.maxWidth < 600) {
        //   // return MobileLayout();
        // } else if (constraints.maxWidth < 1200) {
        //   // return TabletLayout();
        // } else {
        //   // return DesktopLayout();
        // }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              const LanguageToggleButton(),
              TextButton(
                  onPressed: () {
                    compute(captureAndSavePng, null);
                  },
                  child: Text("导出PDF"))
            ],
          ),
          body: Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(color: Colors.yellow),
              ),
              Flexible(
                flex: 3,
                child: RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    color: Colors.blue,
                    child: ItemResume(),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(color: Colors.green),
              ),
              Flexible(
                flex: 2,
                child: Container(color: Colors.yellow),
              ),
            ],
          ),
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
      RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      typed.ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      typed.Uint8List pngBytes = byteData!.buffer.asUint8List();
      createPDF(pngBytes);
    } catch (e) {
      print(e);
    }
  }

//S.of(context).title, "${Load.resumeData?.info.name}",
  Widget ItemResume() {
    return Container(
      child: Text(
        "${S.of(context).title}",
        style: TextStyle(color: Colors.green, fontSize: 16),
      ),
    );
  }

  Widget itemInfo(InfoBean info) {
    return Column(
      children: [],
    );
  }
}
