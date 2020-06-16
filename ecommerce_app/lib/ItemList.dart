import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
          children: List.generate(10, (index) {
            return InkWell(
              splashColor: Colors.blue.withAlpha(30),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        "https://ii1.pepperfry.com/media/catalog/product/m/o/494x544/modern-fibre-armrest-plastic-chair-in-orange-colour-by-finch-fox-modern-fibre-armrest-plastic-chair--zb4e3r.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ); //robohash.org api provide you different images for any number you are giving
          }),
        ),
      ),
    );
  }
}


