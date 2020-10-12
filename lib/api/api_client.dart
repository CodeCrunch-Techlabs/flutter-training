import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qcapp/entity/study_entity.dart';
import '../model/study_model.dart';

class ApiClient {
  String baseUrl;
  String token;
  final http.Client httpClient;

  ApiClient({
    http.Client httpClient,
    this.baseUrl,
    this.token =
        "Y29tLnF1YW50aWZpZWRjaXRpemVuLnN0YWdpbmctY2EuZXh0ZXJuYWw6YWJjMTIz",
  }) : this.httpClient = httpClient ?? http.Client();

  Stream<List<Study>> fetchStudyList() async* {
    final response =
        await httpClient.get(Uri.encodeFull('${this.baseUrl}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Basic ${this.token}"
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["studies"];

    // Mapping array of results
    yield results
        .map((dynamic item) => Study.fromEntity(
            StudyEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
