import 'package:meta/meta.dart';
import 'package:qcapp/entity/study_entity.dart';

@immutable
class Study {
  final String title;
  final String logo;
  final String status;
  final String studyId;
  final String tagline;

  Study(this.title, this.logo, this.status, this.studyId, this.tagline);

  StudyEntity toEntity() {
    return StudyEntity(title, logo, status, studyId, tagline);
  }

  static Study fromEntity(StudyEntity entity) {
    return Study(entity.title, entity.logo, entity.status, entity.studyId,
        entity.tagline);
  }
}
