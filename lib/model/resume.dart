class Resume {
  InfoBean info;
  List<EducationBean> education;
  List<ExperienceBean> experience;

  List<ProjectBean> project;
  List<String> skills;
  List<String> evaluate;

  Resume(
      {required this.info,
      required this.education,
      required this.experience,
      required this.project,
      required this.skills,
      required this.evaluate});

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      skills: map['skills'] == null ? [] : (map['skills'] as List).map((e) => e.toString()).toList(),
      info: InfoBean.fromMap(map['info']),
      education:
          map['education'] == null ? [] : (map['education'] as List).map((e) => EducationBean.fromMap(e)).toList(),
      experience:
          map['experience'] == null ? [] : (map['experience'] as List).map((e) => ExperienceBean.fromMap(e)).toList(),
      project: map['project'] == null ? [] : (map['project'] as List).map((e) => ProjectBean.fromMap(e)).toList(),
      evaluate: map['evaluate'] == null ? [] : (map['evaluate'] as List).map((e) => e.toString()).toList(),
    );
  }

  Map toJson() => {
        "info": info,
        "education": education,
        "experience": experience,
        "project": project,
        "skills": skills,
        "evaluate": evaluate,
      };
}

/// name : ""
/// startDate : ""
/// endDate : ""
/// description : ""
/// technical : ["sqlite","GetX"]
/// location : ""

class ProjectBean {
  String? name;
  String? startDate;
  String? endDate;
  List<String>? description;
  List<String>? technical;

  ProjectBean({this.name, this.startDate, this.endDate, this.description, this.technical,});

  static ProjectBean fromMap(Map<String, dynamic> map) {
    ProjectBean projectBean = ProjectBean();
    projectBean.name = map['name'];
    projectBean.startDate = map['startDate'];
    projectBean.endDate = map['endDate'];
    projectBean.description =
        map['description'] == null ? [] : (map['description'] as List).map((e) => e.toString()).toList();
    projectBean.technical =
        map['technical'] == null ? [] : (map['technical'] as List).map((e) => e.toString()).toList();
    return projectBean;
  }

  Map toJson() => {
        "name": name,
        "startDate": startDate,
        "endDate": endDate,
        "description": description,
        "technical": technical,
      };
}

/// name : ""
/// startDate : ""
/// endDate : ""
/// responsibilities : ["职责",""]
/// post : "Flutter 核心开发"

class ExperienceBean {
  String? name;
  String? startDate;
  String? endDate;
  List<String>? responsibilities;
  String? post;

  ExperienceBean({this.name, this.startDate, this.endDate, this.responsibilities, this.post});

  static ExperienceBean fromMap(Map<String, dynamic> map) {
    ExperienceBean experienceBean = ExperienceBean();
    experienceBean.name = map['name'];
    experienceBean.startDate = map['startDate'];
    experienceBean.endDate = map['endDate'];
    experienceBean.responsibilities =
        map['responsibilities'] == null ? [] : (map['responsibilities'] as List).map((e) => e.toString()).toList();
    experienceBean.post = map['post'];
    return experienceBean;
  }

  Map toJson() => {
        "name": name,
        "startDate": startDate,
        "endDate": endDate,
        "responsibilities": responsibilities,
        "post": post,
      };
}

/// name : ""
/// startDate : ""
/// endDate : ""
/// location : ""
/// discipline : "网络工程"
/// course : []

class EducationBean {
  String schoolName;
  String startDate;
  String endDate;
  String location;
  String discipline;
  List<String> course;

  EducationBean(
      {required this.schoolName,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.discipline,
      required this.course});

  factory EducationBean.fromMap(Map<String, dynamic> map) {
    return EducationBean(
      schoolName: map['schoolName'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      location: map['location'],
      discipline: map['discipline'],
      course: map['course'] == null ? [] : (map['course'] as List).map((e) => e.toString()).toList(),
    );
  }

  Map toJson() => {
        "schoolName": schoolName,
        "startDate": startDate,
        "endDate": endDate,
        "location": location,
        "discipline": discipline,
        "course": course,
      };
}

/// name : "刘晓草"
/// age : 26
/// email : "jurelxc@163.com"
/// phoneNumber : "18656419889"
/// degree : "本科"
/// expect : "Flutter 开发"

class InfoBean {
  String? name;
  int? age;
  String? email;
  String? phoneNumber;
  String? degree;
  String? expect;

  InfoBean({this.name, this.age, this.email, this.phoneNumber, this.degree, this.expect});

  static InfoBean fromMap(Map<String, dynamic> map) {
    InfoBean infoBean = InfoBean();
    infoBean.name = map['name'];
    infoBean.age = map['age'];
    infoBean.email = map['email'];
    infoBean.phoneNumber = map['phoneNumber'];
    infoBean.degree = map['degree'];
    infoBean.expect = map['expect'];
    return infoBean;
  }

  Map toJson() => {
        "name": name,
        "age": age,
        "email": email,
        "phoneNumber": phoneNumber,
        "degree": degree,
        "expect": expect,
      };
}
