import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentdesk/Screens/BookSlider.dart';
import 'package:studentdesk/Screens/BookGrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();

  List suggestions;
  List<String> books = List<String>();

  Future<void> getSuggestions(term) async {
    var response = await http.get(
        "http://studentdesk.in/api/v1/text-search?apiname=textSearch&text=$term");
    setState(() {
      suggestions = jsonDecode(response.body)["data"];
      suggestions.map((e) {
           setState(() {
             books.add(e["name"]);
           });
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Explore",
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "JosefinSans"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: GestureDetector(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "JosefinSans"),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(color: Colors.green, spreadRadius: 1),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[100], spreadRadius: 1),
                        ],
                      ),
                      height: 40,
                      child: SimpleAutoCompleteTextField(
                        key: key,
                        suggestions: books,
                        decoration: InputDecoration(
                          hintText: 'Search by author, book name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 13),
                          prefixIcon: Icon(Icons.search),
                        ),
                        textChanged: (text) {
                          getSuggestions(text);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: BookSlider(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            fontSize: 25,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "JosefinSans"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: BookGrid(),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
