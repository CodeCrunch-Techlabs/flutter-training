import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import 'package:studentdesk/api/demo.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'details.dart';

class Home extends StatefulWidget {
  final user;

  Home(this.user);
  @override
  _HomeState createState() => _HomeState(this.user);
}

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final _search = TextEditingController();

class _HomeState extends State<Home> {
  int _index = 0;

  Map user;

  _HomeState(this.user);
  List books;

  Future<void> loadJsonData() async {
    var response = await http
        .get("http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals");
    setState(() {
      books = jsonDecode(response.body)["data"];
    });
  }

  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();

  List suggestions;
  List<String> bookslist = List<String>();

  Future<void> getSuggestions(keyword) async {
    var response = await http.get(
        "http://studentdesk.in/api/v1/text-search?apiname=textSearch&text=${keyword}");
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
  void initState() {
    super.initState();
    loadJsonData();
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _customeAppBar(context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(29)),
                  // child: TextField(
                  //   controller: _search,
                  //   onChanged: (value) {},
                  //   decoration: InputDecoration(
                  //       icon: Icon(
                  //         Icons.search,
                  //         color: Colors.white,
                  //       ),
                  //       hintText: "Search for a book name, Auther",
                  //       hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                  //       border: InputBorder.none),
                  // ),
                  child: SimpleAutoCompleteTextField(
                    key: key,
                    suggestions: bookslist,
                    controller: _search,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search for a book name, Auther",
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                        border: InputBorder.none),
                    textChanged: (text) {
                      getSuggestions(text);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: _sliderbuild(context),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Most Popular",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                _buildCard(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      child: books == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: books.map((e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Details(e["id"], user)));
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  e["photo"],
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Flexible(
                                  child: Text(
                                    e["name"],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 5, right: 5, bottom: 5),
                                child: Flexible(
                                  child: Text(
                                    e["author"],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _customeAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
              child: Icon(
                Icons.menu,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(29),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(29),
                      ),
                      child: Image.network(
                        user["picture"]["data"]["url"],
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sliderbuild(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        autoPlay: true,
        aspectRatio: 1.0,
        enlargeCenterPage: false,
      ),
      items: books.map((data) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(data["id"], user)));
          },
          child: new Container(
            width: size.width,
            decoration: new BoxDecoration(color: Colors.grey[850]),
            child: Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        data["photo"],
                        fit: BoxFit.cover,
                        width: size.width,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(0, 0, 0, 0),
                                Colors.white,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                child: Center(
                                  child: Text(
                                    data["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
