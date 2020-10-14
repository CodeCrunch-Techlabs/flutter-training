import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class StudyModel {
  final String title;
  final String tagline;
  final String logo;
  final String studyId;

  StudyModel._({
    this.title,
    this.tagline,
    this.logo,
    this.studyId,
  });

}


class Studies {

  List<StudyModel> studyList = [];

  Future<List<dynamic>> fetchStudies() async {
    final response = await http.get(
        'https://sandbox.quantifiedcitizen.com/metadata/studyList',
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization':
              'Basic Y29tLnF1YW50aWZpZWRjaXRpemVuLnN0YWdpbmctY2EuZXh0ZXJuYWw6YWJjMTIz'
        });
    final responseJson = jsonDecode(response.body);
    var selectedStudy = responseJson['studies'].where((study) {
      return study['status'] == "Active" ;   // Filtered data which status value is active.
    } ).toList();


    return selectedStudy; // Return the filtered data.
  }
}
