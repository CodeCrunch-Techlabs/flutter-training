import 'dart:convert';
import 'package:qcstudylistbloc/entity/study_list_entity.dart';

class StudyModel {
  final String title;
  final String tagline;
  final String logo;
  final String studyId;


  StudyModel(this.title, this.tagline, this.logo, this.studyId);

  StudyEntity toEntity() {
    return StudyEntity(title, tagline, logo, studyId);
  }

  static StudyModel fromEntity(StudyEntity entity) {
    return StudyModel(entity.title, entity.tagline, entity.logo,  entity.studyId);
  }
}

