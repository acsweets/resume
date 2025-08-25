import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;
import '../resume/resume_page.dart';

class PdfCaptureHelper {
  static Future<void> generatePdfFromWidget() async {
    try {
      // 创建一个固定尺寸的容器来渲染简历
      final widget = MaterialApp(
        home: Scaffold(
          body: Container(
            width: 794, // A4 宽度 (像素)
            constraints: const BoxConstraints(minHeight: 1123), // A4 高度
            color: Colors.white,
            child: const ResumePage(),
          ),
        ),
      );

      // 使用 WidgetToRenderBoxAdapter 渲染 widget
      final repaintBoundary = RenderRepaintBoundary();
      final renderView = RenderView(
        child: RenderPositionedBox(
          alignment: Alignment.center,
          child: repaintBoundary,
        ),
        configuration: const ViewConfiguration(
          size: Size(794, 1123),
          devicePixelRatio: 2.0,
        ),
        window: ui.window,
      );

      // 渲染 widget 到 RenderObject
      final pipelineOwner = PipelineOwner();
      final buildOwner = BuildOwner(focusManager: FocusManager());
      
      final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: widget,
      ).attachToRenderTree(buildOwner);

      buildOwner.buildScope(rootElement);
      buildOwner.finalizeTree();

      pipelineOwner.rootNode = renderView;
      renderView.prepareInitialFrame();

      pipelineOwner.flushLayout();
      pipelineOwner.flushCompositingBits();
      pipelineOwner.flushPaint();

      // 生成图片
      final image = await repaintBoundary.toImage(pixelRatio: 2.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      
      if (byteData != null) {
        await _createPdfFromBytes(byteData.buffer.asUint8List());
      }

      // 清理资源
      buildOwner.dispose();
    } catch (e) {
      print('PDF 生成失败: $e');
    }
  }

  static Future<void> _createPdfFromBytes(Uint8List pngBytes) async {
    final pdf = pw.Document();
    
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Container(
            width: double.infinity,
            height: double.infinity,
            child: pw.Image(
              pw.MemoryImage(pngBytes),
              fit: pw.BoxFit.contain,
            ),
          );
        },
      ),
    );

    final bytes = await pdf.save();
    
    // Web 端下载
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