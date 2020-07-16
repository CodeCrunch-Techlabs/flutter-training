import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentdesk/Screens/BookSlider.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Explore",style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      fontFamily: "JosefinSans"
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: GestureDetector(
                      child: Text("Login", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "JosefinSans"
                      ),),
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
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[100], spreadRadius: 1),
                  ],
                ),
                  height: 40,
                  child:  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by author, book name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              Container(
                child: BookSlider(),
              )
            ],
          )
        ),
      ),
    );
  }
}


