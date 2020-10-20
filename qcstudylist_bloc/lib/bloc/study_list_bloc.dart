import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qcstudylistbloc/bloc/study_list_event.dart';
import 'package:qcstudylistbloc/bloc/study_list_state.dart';
import 'package:qcstudylistbloc/repository/study_list_repository.dart';

class StudyListBloc extends Bloc<StudyListEvent, StudyListState> {
  final StudyListRepository studyRepository;
  StreamSubscription _studySubscription;

  StudyListBloc({@required this.studyRepository})
      : super(StudyListLoadInProgress());

  @override
  Stream<StudyListState> mapEventToState(StudyListEvent event) async* {
    if (event is LoadStudyList) {
      yield* _mapLoadStudyListState();
    }
    {
      if (event is UpdateStudyList) {
        yield* _mapUpdateStudyListState(event);
      }
    }
  }

  Stream<StudyListState> _mapLoadStudyListState() async* {
    _studySubscription?.cancel();
    _studySubscription = studyRepository.loadStudyList().listen(
          (list) => add(UpdateStudyList(list)),
    );
  }

  Stream<StudyListState> _mapUpdateStudyListState(UpdateStudyList event) async* {
    yield StudyListLoadSuccess(event.studyList);
  }

  @override
  Future<void> close() {
    _studySubscription?.cancel();
    return super.close();
  }
}
