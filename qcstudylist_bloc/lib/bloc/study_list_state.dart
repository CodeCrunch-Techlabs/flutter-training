import 'package:equatable/equatable.dart';
import 'package:qcstudylistbloc/model/study_model.dart';
import 'package:qcstudylistbloc/screens/study_list_screen.dart';

abstract class StudyListState extends Equatable {
  const  StudyListState();

  @override
  List<Object> get props => [];
}

class StudyListLoadInProgress extends StudyListState {}

class StudyListLoadSuccess extends StudyListState {
  final List<StudyModel> studyList;

  const StudyListLoadSuccess([this.studyList = const []]);

  @override
  List<Object> get props => [studyList];
}

class StudyLoadFailure extends StudyListState {}
