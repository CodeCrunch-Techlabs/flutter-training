import 'package:equatable/equatable.dart';
import 'package:qcapp/model/study_model.dart';

abstract class StudyState extends Equatable {
  const  StudyState();

  @override
  List<Object> get props => [];
}

class StudyListLoadInProgress extends StudyState {}

class StudyListLoadSuccess extends StudyState {
  final List<Study> studyList;

  const StudyListLoadSuccess([this.studyList = const []]);

  @override
  List<Object> get props => [studyList];
}

class StudyLoadFailure extends StudyState {}
