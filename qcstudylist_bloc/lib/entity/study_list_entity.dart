import 'package:equatable/equatable.dart';

class StudyEntity extends Equatable {
  final String title;
  final String tagline;
  final String logo;
  final String studyId;


  StudyEntity(this.title,  this.tagline, this.logo, this.studyId);

  @override
  List<Object> get props => [title, tagline, logo, studyId];

  Map<String, Object> toJson() {
    return {
      'title': title,
      'tagline': tagline,
      'logo': logo,
      'studyId': studyId,
    };
  }

  static StudyEntity fromJson(Map<String, Object> json) {
    return StudyEntity(
        json['title'] as String,
        json['tagline'] as String,
        json['logo'] as String,
        json['studyId'] as String
    );
  }
}
