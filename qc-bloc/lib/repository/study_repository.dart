import 'package:qcapp/api/api_client.dart';
import 'package:qcapp/model/study_model.dart';

class StudyRepository {
  ApiClient apiClient;

  StudyRepository() {
    this.apiClient = ApiClient(
        baseUrl: "https://sandbox.quantifiedcitizen.com/metadata/studyList");
  }

  Stream<List<Study>> loadStudyList() async* {
    yield* apiClient.fetchStudyList();
  }
}
