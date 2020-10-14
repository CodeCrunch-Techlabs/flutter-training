import 'package:equatable/equatable.dart';

class StudyEntity extends Equatable {
  final String title;
  final String logo;
  final String status;
  final String studyId;
  final String tagline;

  StudyEntity(this.title, this.logo, this.status, this.studyId, this.tagline);

  @override
  List<Object> get props => [title, logo, status, studyId, tagline];

  Map<String, Object> toJson() {
    return {
      'title': title,
      'logo': logo,
      'status': status,
      'studyId': studyId,
      'tagline': tagline
    };
  }

  static StudyEntity fromJson(Map<String, Object> json) {
    return StudyEntity(
        json['title'] as String,
        json['logo'] as String,
        json['status'] as String,
        json['studyId'] as String,
        json['tagline'] as String);
  }
}
