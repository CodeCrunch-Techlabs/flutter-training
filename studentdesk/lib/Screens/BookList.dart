import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentdesk/Screens/BookSlider.dart';
import 'package:studentdesk/Screens/BookGrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:studentdesk/Screens/SignIn.dart';
import 'package:studentdesk/Login_Cubit/Login_Cubit.dart';
import 'package:studentdesk/Login_Cubit/Login_state.dart';

import 'package:studentdesk/Books_Cubit/Books_state.dart';
import 'package:studentdesk/Books_Cubit/Book_Cubit.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();

  List<String> books = List<String>();

  Future<void> getSuggestions(term) async {
    var response = await http.get(
        "http://studentdesk.in/api/v1/text-search?apiname=textSearch&text=$term");
    setState(() {
      jsonDecode(response.body)["data"].map((e) {
        setState(() {
          books.add(e["name"]);
        });// Stored only books name from list of books for slider.
      }).toList();
    });
  }

  void loadBookList(BuildContext context) {
    final cubit = context.bloc<BooksCubit>();
    cubit.getBookList(); //Call getbooklist to get the list of books from cubit.
  }

  @override
  void initState() {
    super.initState();
    loadBookList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<BooksCubit, BooksState>(
          listener: (context, state) {
              return Text(state.bookList != null ? "" : "" );
            },
          builder: (context, state) {
            if (state is LoadingBooks) {
              return Center( child: CircularProgressIndicator());
            } else if (state is LoadedBookList) {
              return SafeArea(
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
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state){
                                return state.user == null ? Container(
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignIn()));
                                      },
                                      child: BlocBuilder<LoginCubit, LoginState>(
                                        builder: (context, state){
                                          return Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "JosefinSans"),
                                          );
                                        },
                                      )
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.green, spreadRadius: 1),
                                    ],
                                  ),
                                ) : CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                  NetworkImage(state.user.toString()),
                                  backgroundColor: Colors.transparent,
                                );
                              },
                            ),
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
                              BoxShadow(
                                  color: Colors.grey[100], spreadRadius: 1),
                            ],
                          ),
                          height: 40,
                          child: SimpleAutoCompleteTextField(
                            key: key,
                            suggestions: books,
                            decoration: InputDecoration(
                              hintText: 'Search by author, book name',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 13),
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
                        child: BlocBuilder<BooksCubit, BooksState>(
                            builder: (context, state) {
                              return BookSlider(state.bookList); //Pass bookList as argument.
                            }),
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
                        child:  BlocBuilder<BooksCubit, BooksState>(
                            builder: (context, state) {
                              return BookGrid(state.bookList); //Pass bookList as argument.
                            }),
                      )
                    ],
                  ),
                )),
              );
            } else {
              // (state is WeatherError)
              return Container();
            }
          },
        ));
  }
}
