import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studentdesk/Screens/BookList.dart';


import 'package:studentdesk/Books_Cubit/Books_state.dart';
import 'package:studentdesk/Books_Cubit/Book_Cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  final bookid;

  BookDetails(this.bookid);

  @override
  _BookDetailsState createState() => _BookDetailsState(this.bookid);
}

class _BookDetailsState extends State<BookDetails> {
  final bookid;

  _BookDetailsState(this.bookid);

  void loadBookDetails(BuildContext context) {
    final cubit = context.bloc<BooksCubit>();
    cubit.getBookDetails(bookid);//Call function for get the bookdetails from cubit.
  }

  @override
  void initState() {
    super.initState();
    loadBookDetails(context);// Call the function when screen load.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BooksCubit, BooksState>(
        listener: (context, state) {
          return Text(state.bookDetails != null ? "" : "" );
        },
        builder: (context, state){
          if(state is LoadingBooks){//Check state if it's loading the show loader.
           return Center(child: CircularProgressIndicator(),);
          }
          else if(state is LoadedBookdetails){//Check if data loaded then it will show this.
            return SafeArea(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute( builder: (context) => BookList()) );
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center, // This is needed
                        child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                state.bookDetails["photo"],
                                fit: BoxFit.fill,
                                height: 300,
                                width: 200,
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
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  height: 5.0,
                                  width: 30.0,
                                  color: Colors.grey[200],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          state.bookDetails["name"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: state.bookDetails["author"] != ""
                                          ? Text(
                                        "By ${state.bookDetails["author"]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                          : null,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text("Category: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text(state.bookDetails["category"]
                                        ["category_name"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text("Price: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Row(
                                          children: [
                                            Icon(Icons.attach_money,size: 20,),
                                            Text(
                                              state.bookDetails["price"].toString(), style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                            Text(" | ",style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                            Icon(Icons.attach_money,size: 20,),
                                            Text(state.bookDetails["mrp"].toString(),
                                              style: TextStyle(decoration: TextDecoration.lineThrough,
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text("Posted By: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text(state.bookDetails["user"]["name"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text("From: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Row(
                                          children: [
                                            Icon(Icons.home,size: 20,),
                                            Text(state.bookDetails["city"]
                                            ["city_name"],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Theme.of(context).primaryColor,
                                elevation: 7.0,
                                shadowColor: Colors.greenAccent,
                                child: Center(
                                  child: Text(
                                    'Buy this Book',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color:Theme.of(context).primaryColor,
                                elevation: 7.0,
                                shadowColor: Colors.greenAccent,
                                child: Center(
                                  child: Text(
                                    'Get for Exchange',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
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
          else{
            return Container();
          }
        },
      )
    );
  }
}


