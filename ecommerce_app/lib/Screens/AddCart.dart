import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceapp/Screens/CheckoutPage.dart';

class AddCartPage extends StatefulWidget {
  @override
  _AddCartPageState createState() => _AddCartPageState();
}

class _AddCartPageState extends State<AddCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: FaIcon(FontAwesomeIcons.chevronLeft,
                                  color: Theme.of(context).primaryColor),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            GestureDetector(
                              child: Text('My Cart',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                            GestureDetector(
                              child: FaIcon(FontAwesomeIcons.times,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            CartItem(),
                            SizedBox(
                              height: 10,
                            ),
                            CartItem(),
                            SizedBox(
                              height: 10,
                            ),
                            CartItem()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('\$4875',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).secondaryHeaderColor,),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Todo : Need to add dismissible here after you have data.
    return Container(
      height: 121,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[50],
        elevation: 7.0,
        shadowColor: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.network(
                "https://ii1.pepperfry.com/media/catalog/product/m/o/494x544/modern-fibre-armrest-plastic-chair-in-orange-colour-by-finch-fox-modern-fibre-armrest-plastic-chair--zb4e3r.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Beko Slim Chair",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text('By Fred H Haque',
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('\$1625',
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.plus,
                        color: Theme.of(context).primaryColor),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 5),
                    ],
                  ),
                ),
                Text("2"),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.minus,
                        color: Theme.of(context).primaryColor),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 5),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
