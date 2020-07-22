import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studentdesk/Screens/BookDetails.dart';

class BookGrid extends StatefulWidget {
  @override
  _BookGridState createState() => _BookGridState();
}


class _BookGridState extends State<BookGrid> {

  List books;


  Future<void> loadJsonData() async {
    var response = await http
        .get("http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals");
    setState(() {
      books = jsonDecode(response.body)["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: books == null ? CircularProgressIndicator() : GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: books.map((item) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute( builder: (context) => BookDetails(item["id"])) );
            },
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item["photo"],
                        fit: BoxFit.fill,
                        height: 1000,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          item["name"],
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }).toList())
    );
  }
}
