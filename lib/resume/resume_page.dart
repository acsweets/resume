import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../local/language.dart';
import '../model/resume.dart';
import '../widgets/tag.dart';

/// Author:      星星
/// CreateTime:  2024/7/25
/// Contact Me:  1395723441@qq.com
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';


class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    var resume = LanguageInheritedWidget.of(context).resume;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            itemTag(S.of(context).info),
            itemInfo(resume.info, context),
            itemTag(S.of(context).skills),
            itemEntry(resume.skills),
            itemTag(S.of(context).experience),
            itemExperience(resume.experience),
            itemTag(S.of(context).project),
            itemProject(resume.project, S.of(context).technology),
            itemTag(S.of(context).education),
            itemEducation(resume.education),
            itemTag(S.of(context).evaluate),
            itemEntry(resume.evaluate)
          ],
        ),
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
        child: Center(child: Text(tag, style: const TextStyle(color: Colors.white))),
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
              style: const TextStyle(fontSize: 10),
            ),
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget itemEducation(List<EducationBean> educations) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemCount: educations.length,
        itemBuilder: (_, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(educations[i].schoolName)),
                  const Spacer(),
                  Expanded(child: Text("${educations[i].startDate}-${educations[i].endDate}"))
                ],
              ),
              Wrap(
                children: [
                  Text(educations[i].discipline),
                  const SizedBox(width: 20),
                  ...List.generate(educations[i].course.length, (index) => Text(educations[i].course[index]))
                ],
              ),
            ],
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget itemProject(List<ProjectBean> projects, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (_, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(projects[i].name!)),
                  const Spacer(),
                  Expanded(child: Text("${projects[i].startDate}-${projects[i].endDate}"))
                ],
              ),
              Wrap(
                children: [
                  Text(label),
                  ...List.generate(
                      projects[i].technical!.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(projects[i].technical![index]),
                          ))
                ],
              ),
              itemEntry(projects[i].description!),
            ],
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget itemExperience(List<ExperienceBean> experience) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemCount: experience.length,
        itemBuilder: (_, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(experience[i].name!)),
                  const SizedBox(width: 10),
                  Text("${experience[i].post}"),
                  const Spacer(),
                  Expanded(child: Text("${experience[i].startDate}-${experience[i].endDate}"))
                ],
              ),
              itemEntry(experience[i].responsibilities!),
            ],
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
