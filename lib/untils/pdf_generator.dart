
import 'dart:ui';
import 'dart:typed_data' as typed;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume/resume/resume_page.dart';
import 'package:universal_html/html.dart' as html;
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
/// Author:      星星
/// CreateTime:  2024/7/30
/// Contact Me:  1395723441@qq.com

class WidgetToImage {

  static Future<Uint8List> capturePng(BuildContext context, Widget widget, {Size? size}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());

    // 获取当前视图
    // final FlutterView view = View.of(context);
    final FlutterView view = PlatformDispatcher.instance.views.isNotEmpty
        ? PlatformDispatcher.instance.views.first
        : View.of(context);
    // 使用 ViewConfiguration.fromView 创建配置
    final ViewConfiguration configuration = ViewConfiguration.fromView(view);

    // 如果没有指定 size，使用视图的逻辑大小
    size ??= view.physicalSize / configuration.devicePixelRatio;

    final RenderView renderView = RenderView(
      view: view,
      child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
      configuration: configuration,
    );

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: widget,
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();
    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage(pixelRatio: configuration.devicePixelRatio);
    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }
}

class PdfGenerator {

  static Future<typed.Uint8List> captureImage(GlobalKey key) async {
    RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    typed.ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static Future<typed.Uint8List> createPDF(typed.Uint8List pngBytes) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          final pdfImage = pw.MemoryImage(pngBytes);
          return pw.Center(
            child: pw.Image(pdfImage),
          );
        },
      ),
    );
    return pdf.save();
  }

  static void downloadPDF(typed.Uint8List bytes) {
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'resume.pdf';
    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}
