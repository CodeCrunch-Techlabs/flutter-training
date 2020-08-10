import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();

  List suggestions;
  List<String> bookslist = List<String>();

  Future<void> getSuggestions(keyword) async {
    var response = await http.get(
        "http://studentdesk.in/api/v1/text-search?apiname=textSearch&text=$keyword");
    setState(() {
      suggestions = jsonDecode(response.body)["data"];
      suggestions.map((item) {
        setState(() {
          bookslist.add(item["name"]);
        });
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
