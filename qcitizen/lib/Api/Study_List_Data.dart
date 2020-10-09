import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Studies {

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
      return study['status'] == "Active";   // Filtered data which status value is active.
    }).toList();

    return selectedStudy; // Return the filtered data.
  }
}
