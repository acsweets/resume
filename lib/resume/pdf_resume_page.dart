import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../local/language.dart';
import '../model/resume.dart';
import '../widgets/tag.dart';

/// PDF专用的简历页面 - 无滚动，固定布局
class PdfResumePage extends StatelessWidget {
  const PdfResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    var resume = LanguageInheritedWidget.of(context).resume;
    return Container(
      width: 794, // A4宽度
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          itemTag(S.of(context).info),
          itemInfo(resume.info, context),
          const SizedBox(height: 10),
          itemTag(S.of(context).skills),
          itemEntry(resume.skills),
          const SizedBox(height: 10),
          itemTag(S.of(context).experience),
          itemExperience(resume.experience),
          const SizedBox(height: 10),
          itemTag(S.of(context).project),
          itemProject(resume.project, S.of(context).technology),
          const SizedBox(height: 10),
          itemTag(S.of(context).education),
          itemEducation(resume.education),
          const SizedBox(height: 10),
          itemTag(S.of(context).evaluate),
          itemEntry(resume.evaluate),
        ],
      ),
    );
  }

  Widget itemInfo(InfoBean info, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow([
            _buildInfoItem(S.of(context).name, info.name),
            _buildInfoItem(S.of(context).age, info.age.toString()),
            _buildInfoItem(S.of(context).phoneNumber, info.phoneNumber),
          ]),
          const SizedBox(height: 8),
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
    return Row(children: children);
  }

  Widget _buildInfoItem(String label, String? value) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
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
      height: 18,
      width: 100,
      child: CustomPaint(
        painter: DrawTag(depth: 0.2),
        child: Center(
          child: Text(
            tag,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget itemEntry(List<String> entry) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: entry.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            ". $item",
            style: const TextStyle(fontSize: 9),
          ),
        )).toList(),
      ),
    );
  }

  Widget itemEducation(List<EducationBean> educations) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: educations.map((edu) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(edu.schoolName, style: const TextStyle(fontSize: 10))),
                  Text("${edu.startDate}-${edu.endDate}", style: const TextStyle(fontSize: 10)),
                ],
              ),
              Text(edu.discipline, style: const TextStyle(fontSize: 9)),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget itemProject(List<ProjectBean> projects, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: projects.map((project) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(project.name!, style: const TextStyle(fontSize: 10))),
                  Text("${project.startDate}-${project.endDate}", style: const TextStyle(fontSize: 10)),
                ],
              ),
              Wrap(
                children: [
                  Text(label, style: const TextStyle(fontSize: 9)),
                  ...project.technical!.map((tech) => Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(tech, style: const TextStyle(fontSize: 9)),
                  )),
                ],
              ),
              ...project.description!.map((desc) => Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(". $desc", style: const TextStyle(fontSize: 8)),
              )),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget itemExperience(List<ExperienceBean> experience) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: experience.map((exp) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(exp.name!, style: const TextStyle(fontSize: 10))),
                  Text(exp.post!, style: const TextStyle(fontSize: 10)),
                  const SizedBox(width: 10),
                  Text("${exp.startDate}-${exp.endDate}", style: const TextStyle(fontSize: 10)),
                ],
              ),
              ...exp.responsibilities!.map((resp) => Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(". $resp", style: const TextStyle(fontSize: 8)),
              )),
            ],
          ),
        )).toList(),
      ),
    );
  }
}