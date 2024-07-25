import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../model/load.dart';
import '../model/resume.dart';
import '../widgets/tag.dart';

/// Author:      星星
/// CreateTime:  2024/7/25
/// Contact Me:  1395723441@qq.com

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    Resume resume = Load.resumeData!;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemTag(S.of(context).info),
          itemInfo(resume.info, context),
          itemTag(S.of(context).skills),
          itemEntry(resume.skills),
          itemTag(S.of(context).experience),
          itemTag(S.of(context).project),
          itemTag(S.of(context).education),
          ItemEducation(resume.education),
          itemTag(S.of(context).evaluate),
          itemEntry(resume.evaluate)
        ],
      ),
    );
  }

  Widget itemInfo(InfoBean info, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow([
            _buildInfoItem(S.of(context).name, info.name),
            _buildInfoItem(S.of(context).age, info.age.toString()),
            _buildInfoItem(S.of(context).phoneNumber, info.phoneNumber),
          ]),
          const SizedBox(height: 15),
          _buildInfoRow([
            _buildInfoItem(S.of(context).degree, info.degree),
            _buildInfoItem(S.of(context).expect, info.expect),
            _buildInfoItem(S.of(context).email, info.email),
          ]),
        ],
      ),
    );
  }

  Widget _buildInfoRow(List<Widget> children) {
    return Row(
      children: children,
    );
  }

  Widget _buildInfoItem(String label, String? value) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value ?? ''),
          ],
        ),
      ),
    );
  }

  Widget itemTag(String tag) {
    return SizedBox(
      height: 20,
      width: 120,
      child: CustomPaint(
        painter: DrawTag(
          depth: 0.2,
        ),
        child: Center(child: Text(tag, style: TextStyle(color: Colors.white))),
      ),
    );
  }

  Widget itemEntry(List<String> entry) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListView.builder(
        itemCount: entry.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              ". ${entry[i]}",
              style: TextStyle(fontSize: 10),
            ),
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget ItemEducation(List<EducationBean> educations) {
    return ListView.builder(
      itemCount: educations.length,
      itemBuilder: (_, i) {
        return Column(
          children: [
            Row(
              children: [
                Text(educations[i].schoolName)
              ],
            ),
            Text("专业"),
            Text("课程"),
          ],
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
