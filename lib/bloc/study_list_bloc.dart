import 'dart:async';

import 'package:qcapp/bloc/study_list_event.dart';
import 'package:qcapp/bloc/study_list_state.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:qcapp/repository/study_repository.dart';

class StudyBloc extends Bloc<StudyEvent, StudyState> {
  final StudyRepository studyRepository;
  StreamSubscription _studySubscription;

  StudyBloc({@required this.studyRepository})
      : super(StudyListLoadInProgress());

  @override
  Stream<StudyState> mapEventToState(StudyEvent event) async* {
    if (event is LoadStudyList) {
      yield* _mapLoadStudyListState();
    }
    {
      if (event is UpdateStudyList) {
        yield* _mapUpdateStudyListState(event);
      }
    }
  }

  Stream<StudyState> _mapLoadStudyListState() async* {
    _studySubscription?.cancel();
    _studySubscription = studyRepository.loadStudyList().listen(
          (list) => add(UpdateStudyList(list)),
        );
  }

  Stream<StudyState> _mapUpdateStudyListState(UpdateStudyList event) async* {
    yield StudyListLoadSuccess(event.studyList);
  }

  @override
  Future<void> close() {
    _studySubscription?.cancel();
    return super.close();
  }
}
