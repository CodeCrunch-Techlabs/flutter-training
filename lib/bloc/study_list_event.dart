import 'package:equatable/equatable.dart';
import 'package:qcapp/model/study_model.dart';

abstract class StudyEvent extends Equatable {
  const StudyEvent();

  @override
  List<Object> get props => [];
}

class LoadStudyList extends StudyEvent {}

class UpdateStudyList extends StudyEvent {
  final List<Study> studyList;

  const UpdateStudyList(this.studyList);

  @override
  List<Object> get props => [studyList];
}
