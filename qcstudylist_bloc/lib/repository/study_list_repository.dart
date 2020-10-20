import 'package:qcstudylistbloc/api/api_client.dart';
import 'package:qcstudylistbloc/model/study_model.dart';

class StudyListRepository{

  ApiClient apiClient;

  StudyListRepository(){
     this.apiClient = ApiClient(baseUrl: "https://sandbox.quantifiedcitizen.com/metadata/studyList");
  }

  Stream<List<StudyModel>> loadStudyList() async*{
      yield* apiClient.fetchStudyList();
  }

}