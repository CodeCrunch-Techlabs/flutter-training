import 'package:equatable/equatable.dart';
import 'package:qcstudylistbloc/model/study_model.dart';

abstract class StudyListEvent extends Equatable {
  const StudyListEvent();

  @override
  List<Object> get props => [];
}

class LoadStudyList extends StudyListEvent {}

class UpdateStudyList extends StudyListEvent {
  final List<StudyModel> studyList;

  const UpdateStudyList(this.studyList);

  @override
  List<Object> get props => [studyList];
}
