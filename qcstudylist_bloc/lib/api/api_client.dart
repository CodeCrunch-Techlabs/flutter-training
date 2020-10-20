import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:qcstudylistbloc/model/study_model.dart';
import 'package:qcstudylistbloc/entity/study_list_entity.dart';

class ApiClient {
  final String baseUrl;
  final String token;
  final http.Client httpClient;

  ApiClient({
    http.Client httpClient,
    this.baseUrl,
    this.token =
        "Y29tLnF1YW50aWZpZWRjaXRpemVuLnN0YWdpbmctY2EuZXh0ZXJuYWw6YWJjMTIz",
  }) : this.httpClient = httpClient ?? http.Client();

  Stream<List<StudyModel>> fetchStudyList() async* {
    final response =
        await httpClient.get(Uri.encodeFull('${this.baseUrl}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Basic ${this.token}"
    });

    List<dynamic> result = jsonDecode(response.body)["studies"];

    yield result
        .map((dynamic item) => StudyModel.fromEntity(
        StudyEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
