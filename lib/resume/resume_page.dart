import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../model/load.dart';
import '../model/resume.dart';

/// Author:      星星
/// CreateTime:  2024/7/25
/// Contact Me:  1395723441@qq.com

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    Resume resume = Load.resumeData!;
    return Column(
      children: [
        itemInfo(resume.info, context),
      ],
    );
  }

  Widget itemInfo(InfoBean info, context) {
    return Column(
      children: [
        Row(
          children: [
            Text(S.of(context).name),
          ],
        )
      ],
    );
  }
}
