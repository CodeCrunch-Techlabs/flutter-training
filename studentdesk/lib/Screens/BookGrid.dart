import 'package:flutter/material.dart';
import 'package:studentdesk/Screens/BookDetails.dart';




class BookGrid extends StatefulWidget {
  final books;

  BookGrid(this.books);

  @override
  _BookGridState createState() => _BookGridState(this.books);
}


class _BookGridState extends State<BookGrid> {
  final books;

  _BookGridState(this.books); // BookList

  @override
  Widget build(BuildContext context) {
    return Container(
      child: books == null ? Container() : GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
//          childAspectRatio: MediaQuery.of(context).size.width /
//              (MediaQuery.of(context).size.height / 1.5),
        children: books.map<Widget>((item) {
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
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        item["photo"],
                        fit: BoxFit.fill,
                        height: 500,
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
