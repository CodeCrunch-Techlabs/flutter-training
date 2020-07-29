import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookDetails extends StatefulWidget {
  final bookid;

  BookDetails(this.bookid);

  @override
  _BookDetailsState createState() => _BookDetailsState(this.bookid);
}

class _BookDetailsState extends State<BookDetails> {
  final bookid;

  _BookDetailsState(this.bookid);

  var bookdetails;

  Future<void> loadJsonData() async {
    var response =
        await http.get("http://studentdesk.in/api/v1/book-details/$bookid");
    setState(() {
      bookdetails = jsonDecode(response.body)["data"][0];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: bookdetails == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back,
                          color: Colors.white,),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: 500,
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          bookdetails["photo"],
                          fit: BoxFit.fill,
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Theme.of(context).primaryColor,
                              size: 22,
                            ),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Icon(
                              Icons.chat,
                              color:Theme.of(context).primaryColor,
                              size: 22,
                            ),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Icon(
                              Icons.share,
                              color: Theme.of(context).primaryColor,
                              size: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child:Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 5.0,
                              width: 30.0,
                              color: Colors.grey[200],
                            )
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        child: Text(bookdetails["name"],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Container(
                                        child: bookdetails["author"] != "" ? Text("By ${bookdetails["author"]}") : null,
                                      ),
                                    )
                                  ],
                                ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Container(
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Text("Category :"),
                                         Text(bookdetails["category"]["category_name"])
                                       ],
                                     ),
                                   ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Price :"),
                                         Row(
                                           children: [
                                             Icon(Icons.attach_money),
                                             Text(bookdetails["price"].toString())
                                           ],
                                         )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
