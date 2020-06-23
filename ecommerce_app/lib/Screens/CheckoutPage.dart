import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerceapp/Screens/Home.dart';


class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) { assert(mask != null); assert (separator != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {


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
                              child: Text('Checkout Now',
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
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Items (3)",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                "\$4875",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Delivery Services",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$10",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Total Price",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$4885",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Tap");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: PaymentForm()
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

class PaymentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        TextField(
          inputFormatters: [
            MaskedTextInputFormatter(
              mask: 'xxxx-xxxx-xxxx-xxxx',
              separator: '-',
            ),
          ],
          decoration: InputDecoration(
              labelText: 'Card Number',
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).secondaryHeaderColor)),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            hintText: "MM / YY",
            hintStyle: TextStyle(
              color: Theme.of(context).secondaryHeaderColor
            ),
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).secondaryHeaderColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor)),
            focusedErrorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Security Code',
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).secondaryHeaderColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor)),
            focusedErrorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 40.0,
        ),
        Center(
          child: Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Theme.of(context).secondaryHeaderColor,
              elevation: 7.0,
              shadowColor: Theme.of(context).secondaryHeaderColor,
              child: GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Center(
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
